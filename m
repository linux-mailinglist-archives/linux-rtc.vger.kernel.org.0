Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255DCC2785
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2019 22:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbfI3U6o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Sep 2019 16:58:44 -0400
Received: from mout.gmx.net ([212.227.17.20]:46773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfI3U6n (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 30 Sep 2019 16:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1569877121;
        bh=YVn0d0IypIL/I8h6vV2cKfUczuH9hqHhzSGumXeWyH0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AMPrAM7ELWyCVxZjrXAB/9N5xT8tVG0I/V2NGx4vMQRwJ6o8AnTXeboWVyJh35Hlk
         m/UWsmb/ycW3lzs3FbfdeQBKSi5HD8CrW81404JR7GNGYxXRJRXua+OvuRHll2aF24
         AjUrpIxtmirprjRAEcmwA/+txKTK9E1mB2wh6unY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.215.36] ([80.208.215.36]) by web-mail.gmx.net
 (3c-app-gmx-bap76.server.lan [172.19.172.64]) (via HTTP); Mon, 30 Sep 2019
 21:44:12 +0200
MIME-Version: 1.0
Message-ID: <trinity-d5c9e092-508c-4db6-8f36-d5917466a750-1569872652621@3c-app-gmx-bap76>
From:   "Frank Wunderlich" <frank-w@public-files.de>
To:     "Hsin-hsiung Wang" <hsin-hsiung.wang@mediatek.com>,
        "Lee Jones" <lee.jones@linaro.org>
Cc:     "Matthias Brugger" <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
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
Subject: Aw: Re:  Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq
 related code from core driver
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 30 Sep 2019 21:44:12 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1567059876.15320.3.camel@mtksdaap41>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
 <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
 <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
 <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
 <1567059876.15320.3.camel@mtksdaap41>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:mOl5gwFlxXjAE9+q+U636kiILkcV8ouZYqUdavCDgk4kn81Id6pYOUZvJ59xPd2j9ozHN
 8waSlJARwZGU/e+50l22obqu3bIr+fL4TvaYl9BbpYpSPN6sD78VLxIX6iCavbN4CWcQixxp0LcY
 5DMu3BAQcL30VwmxUM6nn/+9zZbxJ+jCY8cBjW5TziN0HhvBmsrBmtkIW/5QN9djuXXP1JwXpdK/
 5ni345mWrIhAsZlycA0M1+K7mg7469HwJwnFxncOyxiAT1no+CMD4+aeZeHKqIzsg87h4YZ/pSN+
 5k=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eEhx1ooA/04=:yFlthYLfXFmb/8JnXCxFLQ
 cG572Ry6AOo0ntKRtpi1jnHwc/MifgtiZkrySHAdMEOwN6U4z5WDniyM2c03SYL4B62yLtMa/
 U19bsTBne7BMQPjUckdu0B6QiZ0aOoGEnogtZ3jkMM2FJ9cfBDeZ4CUM9xrBKWgV9hbYVeYw8
 ctFPp6ZCNOqhulXKMQIq+18/is4xcSGNMxRZVGEwzEMJx++U8FWWJCXC2qy+OwbZsiU72J1rN
 m0hRFgWfSdyu7DwPtFdm/ovEci+00L8n2eHp9e7vBYq6McTpBh3Zd/WuDEeZzaxvPnKIy5OVf
 b6FkzIpwpHNXEv2StcmxkmbpDXuhQmIwZNrLvzNtH0Dy4DR4VWOxCmyD/V4BvyhwngFa5AoUf
 p+0254Ps+QSAuiZx6/4VolVMGw14K3ZT1m4ZxpEuXrppadOsmVegWD2159755ceTite04Efsy
 aKgVhK3bCQDnzeo74/tTd4hgr2ySrWoHotVQtsl5aFU0dX2cVt06TH1Vrr0HNAMLhmR/AJQQq
 0vxTG/EVGDBwvbGEVSllSOx9YpYL7nCGG5O7NFtVFTceEiRJT6zON3viUDNQX97Gp/gxzhX6g
 NY/z5hM5Y+1aVY5vxs2Tj7113FlLFIkd5i+3BOcw9/X5mZha9TUWCedWKxOEUpA1LhYQX1jCD
 Z1RfE1KJ1ZBns7KbOVb5V6YdZR92v3GnYP7c031/xzI5bUKRkkgIrxVsxHjqzVOmNeHM=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

bug is still present in 5=2E4-rc1

dmesg prints this line and at least switch is not inialized on bananapi-r2

mt6397 1000d000=2Epwrap:mt6323: unsupported chip: 0x0

regards Frank


> Gesendet: Donnerstag, 29=2E August 2019 um 08:24 Uhr
> Von: "Hsin-hsiung Wang" <hsin-hsiung=2Ewang@mediatek=2Ecom>
> An: "Frank Wunderlich" <frank-w@public-files=2Ede>, "Matthias Brugger" <=
matthias=2Ebgg@gmail=2Ecom>
> Cc: linux-mediatek@lists=2Einfradead=2Eorg, "Mark Rutland" <mark=2Erutla=
nd@arm=2Ecom>, "Alessandro Zummo" <a=2Ezummo@towertech=2Eit>, "Alexandre Be=
lloni" <alexandre=2Ebelloni@bootlin=2Ecom>, srv_heupstream@mediatek=2Ecom, =
devicetree@vger=2Ekernel=2Eorg, "Greg Kroah-Hartman" <gregkh@linuxfoundatio=
n=2Eorg>, "Sean Wang" <sean=2Ewang@mediatek=2Ecom>, "Liam Girdwood" <lgirdw=
ood@gmail=2Ecom>, "Rob Herring" <robh+dt@kernel=2Eorg>, linux-kernel@vger=
=2Ekernel=2Eorg, "Richard Fontana" <rfontana@redhat=2Ecom>, "Mark Brown" <b=
roonie@kernel=2Eorg>, linux-arm-kernel@lists=2Einfradead=2Eorg, "Ren=C3=A9 =
van Dorst" <opensource@vdorst=2Ecom>, "Thomas Gleixner" <tglx@linutronix=2E=
de>, "Eddie Huang" <eddie=2Ehuang@mediatek=2Ecom>, "Lee Jones" <lee=2Ejones=
@linaro=2Eorg>, "Kate Stewart" <kstewart@linuxfoundation=2Eorg>, linux-rtc@=
vger=2Ekernel=2Eorg
> Betreff: Re: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq rel=
ated code from core driver
>
> Hi Frank/Matthias,
>=20
> On Fri, 2019-08-23 at 19:16 +0200, Frank Wunderlich wrote:
> > > Gesendet: Freitag, 23=2E August 2019 um 17:42 Uhr
> > > Von: "Matthias Brugger" <matthias=2Ebgg@gmail=2Ecom>
> >=20
> > > I suppose that's because 3/10 has code that should be in 2/10 and fo=
r some
> > > reason 3/10 was not pushed for linux-next inclusion=2E Although it h=
as the same
> > > Acked-for-mfd-by tag=2E
> > >
> > > @Frank, can you test if adding 3/10 to your code base fixes the issu=
e?
> >=20
> > adding part 3 [1] seems to fix the issue too
> >=20
> > [    4=2E960051] mt6323-regulator mt6323-regulator: Chip ID =3D 0x2023
> >=20
> > thanks
> >=20
> > [1] https://patchwork=2Ekernel=2Eorg/patch/11110509/
> Thanks for your comments=2E
> The root cause seems I didn't split the code well=2E
> I will fix it in the next version=2E
>=20
>
