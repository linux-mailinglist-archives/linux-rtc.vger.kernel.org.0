Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70DCE695B9
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2019 17:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390292AbfGOO7u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jul 2019 10:59:50 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:56733 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390634AbfGOO7t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Jul 2019 10:59:49 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 01B4B240005;
        Mon, 15 Jul 2019 14:56:38 +0000 (UTC)
Date:   Mon, 15 Jul 2019 16:56:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [v4,1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Message-ID: <20190715145637.GG4732@piout.net>
References: <20190715101520.22562-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190715101520.22562-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/07/2019 18:15:19+0800, Biwen Li wrote:
> +	device_init_wakeup(&pdev->dev, true);
> +	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "ftm-alarm",
> +							&ftm_rtc_ops,
> +							THIS_MODULE);

To be clear, I want you to not use devm_rtc_device_register and use
devm_rtc_allocate_device and rtc_register_device.

> +	if (IS_ERR(rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "can't register rtc device\n");
> +		return PTR_ERR(rtc->rtc_dev);
> +	}
> +

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
