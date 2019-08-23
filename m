Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FCE9B341
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405258AbfHWP1X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 11:27:23 -0400
Received: from mout.gmx.net ([212.227.15.18]:53313 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405254AbfHWP1X (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 11:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566573994;
        bh=Zp3rIEiWFT/dze56KH17pc3w7hpd4V6pR+eI+ZXCu3M=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=eF59Hom6dWe897cYMpJUjOA3BSPM1ZDhDFCb3zy4paWKzPVh/BJcTArszKqjkTZ4B
         LOmKbuy94EofNxw7Xl8vyes9csFFHJHpErD6QsnXBGdWWydUA/PanhgCcP5WHSz431
         oEtnvrbgYoOES0FgaZmmBKwoRE72BT3U22d7l9ME=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.159.16.108] ([80.187.106.162]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1i1BST3icq-0007yy; Fri, 23
 Aug 2019 17:26:34 +0200
Date:   Fri, 23 Aug 2019 17:26:30 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com> <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11> <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
Reply-to: frank-w@public-files.de
To:     linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Richard Fontana <rfontana@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-rtc@vger.kernel.org
From:   Frank Wunderlich <frank-w@public-files.de>
Message-ID: <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
X-Provags-ID: V03:K1:MlEGagT+FxNsAXYs/gx5WKMizc7kwSvyFUw/hTdq7YzFpwt6Zhn
 5UfK75n7wwRUKjmfPzWHnQelpZHnvazt0+9AFA28McB6YDZTZOTb05dAflzdvUC+CaTmUTW
 /7QG52/cIRR3NjqPis1bJEmb6ZhOUiAKyFf8r4seFicKLQ4zFS2VHUNEQGjBTeoLV5pdnLt
 6kS8NGzUhCnMMaKRP1gaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KpTz2cCVoPo=:Dl6DzB+tsFkVmbbzgg231O
 64z4l1siG51mmum9OGGWnmGFctN4tPPxgS9nTw2hIL3knuPPlM8XVRczUnZBeG3MEsGzrl7jN
 1x1W5nRSlvueAtdiKfLJ2jSwCpU8CHeN1LqaUip/XBhyLokZ8Sc6LnT9kMOa7tbxHpMWx8fSA
 eADwOE/+DytC0MgWOcZ9Eegu0Gd4EyQbE3O40E1rWccjNbLVEmpcOhV/Ixqz9Nh9pgZ1bgueY
 TqTgTnHHeS1c6WBasTT+5iMyc+ZX8pkdWfzfJYGrHJhrUdgiYxqAmFtpaO0R7fiwupI4mVExl
 FyR40FFwZ4aEp3niguXguSZ27Qvdv+DVcZ5tW1WKoKl6zpFRF78zQR6gJzru+eqy833QGbWiM
 uGSvuvcMQwwyzcWEjvMyXprX7iEPUiGqfkPdiSXvrjDD1DMAAhMYLeFjP5r/FZHX9O5XqMs+9
 IKQJIOdZ+n3NRn7R434/ryo027mFo04b4plEuSbAW4SDF+USDCMxj4kXL86lhyMjq+w4/Nygy
 eZSTjl00Xj2wBXBNm8lcgjSNmkFYDF+OMvwB0CdAmE2cZRnzHO/rWpwdSrPqokg+SatDVkqxU
 Ls/W7QYjhX7YZqbmoMVcZxO4czRO5xaLcyNJvTOgYR/kfd3f/qL1rc1AFuH7Ed6GRz1m1uzwe
 GCw0Tq61YQqDK+eylXsrBKblDIUDw8ttZUC+wKvBV/vtdOEZlzj2lfUBBl+7AjAcRQlqWqs7E
 p/wf9cLc+KtT8H4jwLBG1YFARoEAFqD/W/OAWAq28/o+IPF3b2dlkqIRwJH/rzOb/LJWkMvsk
 5vY9U69KPcCkxILQTzGebM/M8Cj2GpwDmW7QpxmtRDk6G6lxZaEqt5FiQOC5cmrC3uQ3t/Awb
 ZLXMoTTXvU+cN15u8m7uh5uWOWDsFz7uesHD43yKTIYk9y25EgJUtW/+ineBL4UY29b2Ncio6
 gXeLeTT+NjSTx0COqFypWM3sKZ9NScWOMewqsnYymone6wPN5yuLZ/Q61OzCkiNt4z+TM7E2w
 YXMcgjKKFp+9vOmAtveaHpAGEPhmUWesCew5FLvSsy8sAGcSTj+xiwmxnUJ1X6HmABQgvctO8
 mhhda235WkbaUBPyuZAjPcKEUQ/iDB9kCMmqCZhpE150ptn7B5BpxmysxjHHjPCclbHufkGj0
 k0/h3u1apZYIm1KRm/HYlhHd8NsP+jS3Rzidw9t30or3FDmw==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



Am 23=2E August 2019 16:56:13 MESZ schrieb Matthias Brugger <matthias=2Ebg=
g@gmail=2Ecom>:
>are you sure that you provide the correct chip_id here? I saw 0x2023
>(if I
>remember correctly), while this switch checks for 0x23, 0x91 and 0x97,
>so I'm
>not sure if the problem really lies here=2E I didn't dig into the code to
>find out
>how the chip_id is created=2E

The chip-id 0x2023 is reported with 5=2E3-rc5, next-code says 0x0=2E So i =
guess the chipid is read out/calculated the wrong way=2E If calculation is =
not changed the read is changed compared to 5=2E3
