Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278FB32FCEC
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Mar 2021 20:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhCFT5o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 6 Mar 2021 14:57:44 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:45605 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhCFT5g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 6 Mar 2021 14:57:36 -0500
Received: by mail-pf1-f179.google.com with SMTP id j12so4425411pfj.12;
        Sat, 06 Mar 2021 11:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KQqY8QPhXFTEar+Ux6aNIB5JucD1ppbDhSjCP3APe8w=;
        b=SdMAFoYhKx/FXkqLhoOTvjACambk+S7TRJQU1j3IfocJUhCaezNTTrAFgRvmD4jE2X
         sI82g10xYpOmUV8Z/qI2BPwBNbfgVvgE3xir6zsU/pPSgH+BVxl6Ss0ZM9RNQzdURw/p
         P3PLoF1JZb3a752Ae03BeBUWWVPNkPGUKdBYsBcJkt7bZ3oTSxNxvBIvZekQTHTe8g1H
         6GbNcTmpW+vmi8H/rZNNH3GXBlUbqHqJ3/FE7kTvCas1nh9qu6FB9JcW3l9vTuBiXXy5
         yihIVxBrz39psVuTDCbUUrqVxDruImafP9VxUwKQIAsGIHYj2ZQUsmxET6vTnBrrccBA
         8k7Q==
X-Gm-Message-State: AOAM530b4QUqukWHBgm0m7+qE9r9Im1Fv1225W5iJYKi9jUxhw0bdV29
        4IEg1KcXboANPo/v9ZMirA==
X-Google-Smtp-Source: ABdhPJz1DsAX/KAMSJdNpzi8tpKb/zdwy3rRKYSV+TEJqGpEzjIoWXc/yGtoSU2EN0X4DhjrSEfd1g==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id k19-20020a056a001693b02901ecb0af0d1dmr14493676pfc.42.1615060655654;
        Sat, 06 Mar 2021 11:57:35 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id k64sm6295171pga.52.2021.03.06.11.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 11:57:34 -0800 (PST)
Received: (nullmailer pid 1119603 invoked by uid 1000);
        Sat, 06 Mar 2021 19:56:45 -0000
Date:   Sat, 6 Mar 2021 11:56:45 -0800
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210306195645.GA1112592@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net>
 <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > the clock is disabled and all i.MX6 functionality depending on
> > > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > 
> > > > The proper solution would be to describe this dependency in DT,
> > > > but that will result in a deadlock. The kernel will see, that
> > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > 
> > > 
> > > Reading the previous paragraph, I was going to suggest describing the
> > > dependency and wondering whether this would cause a circular dependency.
> > > I guess this will keep being an issue for clocks on an I2C or SPI bus...
> 
> Yes, it is a circular dependency on this particular system on
> module. It only works because the RTC enables the clock by
> default. The i.MX6 CKIL is expected to be always enabled.

I think you should describe the circular clocking and then provide a way 
to break the dependency. It's a somewhat common issue.

Rob
