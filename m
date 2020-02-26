Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A395016FECB
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2020 13:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgBZMWD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Feb 2020 07:22:03 -0500
Received: from mo4-p05-ob.smtp.rzone.de ([85.215.255.132]:22321 "EHLO
        mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgBZMWD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Feb 2020 07:22:03 -0500
X-Greylist: delayed 709 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Feb 2020 07:22:02 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582719721;
        s=strato-dkim-0002; d=dsitri.de;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vDoUQW8f00C/Wg/EJeX1UisXIv2pOpI4xutNj0UlVGo=;
        b=KiR0lpv5XSp8+8lDVJXatTvrPlNAtFcM3yQ/BfimH6gnR+EdmTBK6v+kxF3/VdN4bw
        LKibEP3+PHUk5kWoN89/SVqq+tKfgz6u5QynpD5TnK7+8wOKq0TqdK9zFOjvtHW33GXT
        sjt0WeIjJ+HbQ1ahHIC/DBaW+ZwQWSpJRykwgT06jdhWXkjkWIeIz0JO+8m5kOEUD4M3
        jXGrYWgvxWNUPJcATCXrLaKsiPSMUIoX7NXYiBD4kgy4xfrN2kVD3NgphiBFY8hABYFB
        aGPIBYi9m9easfPOzCBPYccKvygrlXcXIIUxMjSqJwM4nkDhSuj8zOshGTB+h6Ww5P1n
        IoYw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAjw43pUzk="
X-RZG-CLASS-ID: mo05
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QC9x4Ut
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 13:09:59 +0100 (CET)
Subject: Re: [PATCH v5 0/5] Add rtc support for rn5t618 mfd
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@computer.org>
In-Reply-To: <20191220122416.31881-1-andreas@kemnade.info>
Date:   Wed, 26 Feb 2020 13:09:58 +0100
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FE7F4B7-7D81-4005-A765-2B447B757B53@computer.org>
References: <20191220122416.31881-1-andreas@kemnade.info>
To:     lee.jones@linaro.org
X-Mailer: Apple Mail (2.3124)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

> Am 20.12.2019 um 13:24 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> In the variant RC5T619 the mfd has an RTC. This patchset adds
> support for it. To do so it adds the missing register defines in=20
> rn5t618.h and general irq handling for that.
> It seems that the irq definitions are the same except missing RTC
> but due to missing ability to test that I do not add them here.
>=20
> The rtc driver itself is based on=20
> =
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kerne=
l.tar.bz2
> but heavily reworked.
>=20
> It was tested on the Kobo Clara HD.
>=20
> For cleaning up there is a separate off-topic patch:
> mfd: rn5t618: cleanup i2c_device_id
>=20
> Changes in v5:
> - static rn5t618_irq_init
> - PLATFORM_DEVID_NONE
> - added some Acked-Bys
>=20
> Changes in v4:
> - use macros for IRQ definitions
> - merge rn5t618-core.c and rn5t618-irq.c
>=20
> Changes in v3:
> - alignment cleanup
> - output cleanup, remove useless toggling of alarm flag in rtc probe
> - updated bindings description, so patch 1/5 becomes 2/6 and so on
>=20
> Changes in v2:
> - no dead code in irq code
> - various improvements and cleanups in rtc driver itself
>=20
> Andreas Kemnade (5):
>  dt-bindings: mfd: rn5t618: Document optional property interrupts
>  mfd: rn5t618: add IRQ support
>  mfd: rn5t618: add RTC related registers
>  mfd: rn5t618: add more subdevices
>  rtc: rc5t619: add ricoh rc5t619 RTC driver

what has happened to this series?
It looks like something got lost so that it has not yet arrived in =
linux-next.

BR and thanks,
Nikolaus Schaller

>=20
> Documentation/devicetree/bindings/mfd/rn5t618.txt |   4 +
> drivers/mfd/Kconfig                               |   1 +
> drivers/mfd/rn5t618.c                             | 109 +++++-
> drivers/rtc/Kconfig                               |  10 +
> drivers/rtc/Makefile                              |   1 +
> drivers/rtc/rtc-rc5t619.c                         | 444 =
++++++++++++++++++++++
> include/linux/mfd/rn5t618.h                       |  26 ++
> 7 files changed, 593 insertions(+), 2 deletions(-)
> create mode 100644 drivers/rtc/rtc-rc5t619.c
>=20
> --=20
> 2.11.0

