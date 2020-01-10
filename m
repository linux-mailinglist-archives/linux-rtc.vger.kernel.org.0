Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488B21367EF
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2020 08:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgAJHIj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Jan 2020 02:08:39 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:45218 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgAJHIj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 10 Jan 2020 02:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=449GfKH7sH7qx3uVz7I+DZvudTQJS9ufr7oEB5vY7Bc=; b=n72BZQ67zmmXppM/xkdr0487Kv
        veCzIUlqMEvfTPlQiEU+MY2d7q6mdgXHkJh42V45xkQ1in2Lg/wZMkoG5SEFnA4GA/VyhufBrk4cW
        DK3rVmmk87TlII2wB9F/360lSMWaegs2aBeQKC6gzLzmZFywL4JzudH+wEEccF709Zt4=;
Received: from [2a02:790:ff:1019:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ipoPD-0003jT-04; Fri, 10 Jan 2020 08:08:27 +0100
Received: from localhost.lan ([::1] helo=localhost)
        by localhost with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ipoPA-0001VA-Rz; Fri, 10 Jan 2020 08:08:24 +0100
Date:   Fri, 10 Jan 2020 08:08:24 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Subject: Re: [PATCH v5 0/5] Add rtc support for rn5t618 mfd
Message-ID: <20200110080824.727a612d@kemnade.info>
In-Reply-To: <20191220122416.31881-1-andreas@kemnade.info>
References: <20191220122416.31881-1-andreas@kemnade.info>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

I hope everyone went well into new year, are there any open
issues left here preveting applying these patches?

On Fri, 20 Dec 2019 13:24:11 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> In the variant RC5T619 the mfd has an RTC. This patchset adds
> support for it. To do so it adds the missing register defines in 
> rn5t618.h and general irq handling for that.
> It seems that the irq definitions are the same except missing RTC
missing words ... for the rn5t618 ...

> but due to missing ability to test that I do not add them here.
> 
> The rtc driver itself is based on 
> https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
> but heavily reworked.
> 
> It was tested on the Kobo Clara HD.
> 
> For cleaning up there is a separate off-topic patch:
> mfd: rn5t618: cleanup i2c_device_id
> 
> Changes in v5:
> - static rn5t618_irq_init
> - PLATFORM_DEVID_NONE
> - added some Acked-Bys
> 
> Changes in v4:
> - use macros for IRQ definitions
> - merge rn5t618-core.c and rn5t618-irq.c
> 
> Changes in v3:
> - alignment cleanup
> - output cleanup, remove useless toggling of alarm flag in rtc probe
> - updated bindings description, so patch 1/5 becomes 2/6 and so on
> 
> Changes in v2:
> - no dead code in irq code
> - various improvements and cleanups in rtc driver itself
> 
> Andreas Kemnade (5):
>   dt-bindings: mfd: rn5t618: Document optional property interrupts
>   mfd: rn5t618: add IRQ support
>   mfd: rn5t618: add RTC related registers
>   mfd: rn5t618: add more subdevices
>   rtc: rc5t619: add ricoh rc5t619 RTC driver
> 
>  Documentation/devicetree/bindings/mfd/rn5t618.txt |   4 +
>  drivers/mfd/Kconfig                               |   1 +
>  drivers/mfd/rn5t618.c                             | 109 +++++-
>  drivers/rtc/Kconfig                               |  10 +
>  drivers/rtc/Makefile                              |   1 +
>  drivers/rtc/rtc-rc5t619.c                         | 444 ++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h                       |  26 ++
>  7 files changed, 593 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/rtc/rtc-rc5t619.c
> 
> -- 
> 2.11.0
> 
> 
