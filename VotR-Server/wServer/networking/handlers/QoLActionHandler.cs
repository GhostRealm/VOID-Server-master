using wServer.realm;
using wServer.realm.entities;
using wServer.networking.packets;
using wServer.networking.packets.incoming;

namespace wServer.networking.handlers
{
    internal class QoLActionHandler : PacketHandlerBase<QoLAction>
    {
        public override PacketId ID => PacketId.QOLACTION;

        protected override void HandlePacket(Client client, QoLAction packet) {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet));
        }

        private static void Handle(Player player, RealmTime time, QoLAction packet) {
            switch (packet.ActionId) {
                case 1:
                    if (player.SorStorage >= 25) {
                        var acc = player.Client.Account;
                        player.Client.Manager.Database.UpdateSorStorage(acc, -25);
                        player.SorStorage -= 25;
                        player.ForceUpdate(player.SorStorage);
                        player.SendHelp("You now have " + player.SorStorage + " void fragments left. A Void Stone has been sent to your vault!");
                        player.Client.Manager.Database.AddGift(acc, 0x49e5);
                    } else {
                        player.SendError("You can't construct a Void Stone with less than 30 fragments.");
                    }
                    break;
                default:
                    player.SendError("Inproper action ID.");
                    break;
            }
        }
    }
}
