Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EEE320B3
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Jun 2019 22:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFAUkF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Jun 2019 16:40:05 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:40787 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAUkE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 Jun 2019 16:40:04 -0400
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F693200009;
        Sat,  1 Jun 2019 20:39:57 +0000 (UTC)
Date:   Sat, 1 Jun 2019 22:39:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>,
        Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] rtc: tegra: Dust off and deferred probe support
Message-ID: <20190601203955.GZ3274@piout.net>
References: <20190527101359.5898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527101359.5898-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/05/2019 12:13:56+0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra RTC driver has accumulated a bit of dust over the
> years. Make a pass over it, addressing checkpatch warnings and fixing
> some inconsistencies in comments and kernel messages as well as in
> variable types and names.
> 
> Once cleaned up, also turn the driver into a regular driver in order
> to support deferred probe which is needed to avoid a future regression
> on Tegra186 and later.
> 
> Thierry
> 
> Thierry Reding (3):
>   rtc: tegra: checkpatch and miscellaneous cleanups
>   rtc: tegra: Use consistent variable names and types
>   rtc: tegra: Turn into regular driver
> 
>  drivers/rtc/rtc-tegra.c | 254 ++++++++++++++++++++--------------------
>  1 file changed, 128 insertions(+), 126 deletions(-)
> 

All applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
