Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E089B553
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 19:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbfHWRRP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 13:17:15 -0400
Received: from mout.gmx.net ([212.227.17.20]:51531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387641AbfHWRRP (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 13:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566580580;
        bh=KAOdaynKbihaITcaFt4WqiyRLZbtSP/RJI/uMxSYwAA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Xusb0Xj64yL0T6lEq8KfvIbQDlrHe2gC7RLsib5J7rTaqGSAMg6/Ur+73Ny2qekSq
         8r9+RAb9gtoR7XFFc6mC31NlMvYo3q3cgFMEtFchyGoO/+De2yJYzL5qDkxhAlZ746
         XuwMFuSlD//ORk1PvvrRpTE0thLPtaGwE/GSjqz4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.154.8] ([217.61.154.8]) by web-mail.gmx.net
 (3c-app-gmx-bs75.server.lan [172.19.170.219]) (via HTTP); Fri, 23 Aug 2019
 19:16:20 +0200
MIME-Version: 1.0
Message-ID: <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
From:   "Frank Wunderlich" <frank-w@public-files.de>
To:     "Matthias Brugger" <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sean Wang" <sean.wang@mediatek.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        "Richard Fontana" <rfontana@redhat.com>,
        "Mark Brown" <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Eddie Huang" <eddie.huang@mediatek.com>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        linux-rtc@vger.kernel.org
Subject: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related
 code from core driver
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 23 Aug 2019 19:16:20 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
 <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
 <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:M6tggHu2jkIqLMSHLX83dNUDyHrefgQf8IujR0hyiRKzkuklyndiHW9nYGEkuLXCbOFMO
 SU+tldv0OOjj7fhdIotEInIhprMyKcHFTkDmg3Efi+cKsHLNCA4guu9ErTmP0DGbBBpZpN41036a
 tuKt30R+dNFMZUaZY7u53km3KLRC2mt9/svU71MSZNnuo+/30tBC7dIXkuBB4vRLB+OQsdK4O50+
 XX6VyQNrBSgCyXPZ1HhTjjLmG/rbSC9Y4CbSc2JU2HAPRc62AwxY1qZsv6BFDYP7/gsYLXNh4pyc
 20=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TOoEHewdCY8=:S/v5Ky3YBDWNjot/2PylTF
 kK4NljRpELNyO9TgpRHOWLeukFdMAosLfLxz3bWRabDlr3Sfb/rlMknadYnt7/PvLo2b3piM1
 smjOdh6YxQQuRfqIMtvhk5i6BbszdW3monJEzwT+6Kky7MJIES1cblfZ11cvocxi2NZInCaCT
 rTdZFThb/PDsgySQMgfbLL3ETPBcAQS+YtdZRS/7hDoiNYkYpCyxw0xZ+LbUOd02TY9KFuoNh
 +Eb/5DGmKIn7gvJKawUveefsQvtzoYPVBUrPR/IgdXMpyce7AHlatkvq0lxNp098Yy+tO995P
 1zQq4mgbIHnkw3zZkhw0IBAYfpBGkTqhmrzJQ7+ePW2AEZ2zwzZY08fuv/O0X6DEXqO2dELtd
 /zDW//zdP5Ns35UQN/VOEl6zp+/NzWh6kfYCtQ/eW3Ns2eFrdreUSaJBzmH18vpsMZ86rpmXS
 ib8TdXaLtUf981KqYi0y3TWbY8KkzmW0VtFuAc7arSxVf/ZSdRhFM07FyiD4uwDASn+EVYLU8
 JOkoLAghKWioW2JbWYU3cAdvK47ZHFdRFzdXFMSJePxEGvew4Y+hNXk1icKwNpUZjMtHzDvBF
 0b6mmpA96LbZ7PR6g8lsDIU2M+8snOHHumaDSNyt+N2sZFA4EMTfFaMec5EZR45lxuMBlvd3w
 sipzH8uF4e4HsVt40jHmE4miAlyyc1ED5nuwyGLE0/9eNzw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Gesendet: Freitag, 23. August 2019 um 17:42 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>

> I suppose that's because 3/10 has code that should be in 2/10 and for so=
me
> reason 3/10 was not pushed for linux-next inclusion. Although it has the=
 same
> Acked-for-mfd-by tag.
>
> @Frank, can you test if adding 3/10 to your code base fixes the issue?

adding part 3 [1] seems to fix the issue too

[    4.960051] mt6323-regulator mt6323-regulator: Chip ID =3D 0x2023

thanks

[1] https://patchwork.kernel.org/patch/11110509/
