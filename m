Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12141F4899
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jun 2020 23:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFIVFw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 17:05:52 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41079 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgFIVFw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 17:05:52 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A81BEC0008;
        Tue,  9 Jun 2020 21:05:49 +0000 (UTC)
Date:   Tue, 9 Jun 2020 23:05:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     liambeguin@gmail.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: pcf2127: add alarm support
Message-ID: <20200609210549.GU3720@piout.net>
References: <20200607170610.24534-1-liambeguin@gmail.com>
 <20200607170610.24534-3-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200607170610.24534-3-liambeguin@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/06/2020 13:06:09-0400, liambeguin@gmail.com wrote:
>  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> @@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  
>  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
>  
> +	device_init_wakeup(dev, true);
> +

This can't be done unconditionally, You need to have been able to
request an interrupt or the wakeup-source property needs to be present.

The interrupt handler is also missing from the patch.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
