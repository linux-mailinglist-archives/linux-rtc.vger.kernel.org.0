Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3513374B9E
	for <lists+linux-rtc@lfdr.de>; Thu,  6 May 2021 01:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhEEXB6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 19:01:58 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:42717 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhEEXB6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 19:01:58 -0400
Received: by mail-oi1-f169.google.com with SMTP id v24so3737241oiv.9;
        Wed, 05 May 2021 16:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XnP8SPohUuOUrcF5CvnUQpW+7Amf898SU0gjNiJgV3k=;
        b=uZHnLcFCorP7hN7f+KbmkKVtC8VUYLczc4M5Uv4Ml6KvMppoKDSguaXNeZ7GpO4dF5
         MfDLJ1z7rnVFNli7Fer8t4UXl7N/6vRmPZFcQagflt1qsAYjzTctjpyN9sfGIHyDqZYn
         voGbgtHuazwEmfQUvycZ2HzMJr5w3URAJu7j3Qt5cGWTNnVU+Pwz1c38EwzGAkt6DHu8
         D89LQtI5vpWHXxCldYZDMUX+Vmb6Q+E7o87I/ToE1yLf3OGjseoWs4Jfs/0MiXYWsS2l
         UZViQUW31KwtktlabKF+RBNTKVd6rAZ9qeMx2ECF93RDqOkxr/7J0iROoxgWVta2yk76
         AOug==
X-Gm-Message-State: AOAM532LIrEh4Y++HUbtt/GDPgNcMEGXqHwJBIJKMj8J2LKnkTFlsgKg
        yHqjWLse7VBcngOm5Cr7pw==
X-Google-Smtp-Source: ABdhPJy83Puha7n6Ax2Emr94H3gEDoAwjFI7ehiaGvyyZXu6y2E6RKtqEpMdVrTxovKDHLwWEbBcpg==
X-Received: by 2002:aca:2813:: with SMTP id 19mr8842971oix.23.1620255660629;
        Wed, 05 May 2021 16:01:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r14sm217795oth.3.2021.05.05.16.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:00:59 -0700 (PDT)
Received: (nullmailer pid 3001129 invoked by uid 1000);
        Wed, 05 May 2021 23:00:57 -0000
Date:   Wed, 5 May 2021 18:00:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        linux-mtd@lists.infradead.org,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@collabora.com, Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Message-ID: <20210505230057.GA3001067@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 29 Apr 2021 00:29:49 +0200, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
> 
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
> 
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
> 
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
> 
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
