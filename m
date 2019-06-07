Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BDD389E2
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2019 14:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfFGMLe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Jun 2019 08:11:34 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:46583 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGMLe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 7 Jun 2019 08:11:34 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F2CF9FF809;
        Fri,  7 Jun 2019 12:11:26 +0000 (UTC)
Date:   Fri, 7 Jun 2019 14:11:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Message-ID: <20190607121126.GG5168@piout.net>
References: <20190605122613.21303-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605122613.21303-1-digetx@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/06/2019 15:26:13+0300, Dmitry Osipenko wrote:
> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
> macro has no effect for the OF drivers since the alias is overridden by
> the drivers core to follow the OF naming convention of the driver's alias,
> which is based on the device-tree matching name.
> 
> $ cat /sys/devices/soc0/7000e000.rtc/modalias
> of:NrtcT(null)Cnvidia,tegra20-rtc
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/rtc/rtc-tegra.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
