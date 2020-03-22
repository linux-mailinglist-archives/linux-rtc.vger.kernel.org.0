Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66DB18EC77
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCVVMk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:12:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51607 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgCVVMj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:12:39 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 623B0C000B;
        Sun, 22 Mar 2020 21:12:38 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:12:37 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Peng Ma <peng.ma@nxp.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
        ran.wang_1@nxp.com, biwen.li@nxp.com
Subject: Re: [PATCH] rtc: fsl-ftm-alarm: enable acpi support
Message-ID: <20200322211237.GD221863@piout.net>
References: <20200318025354.6447-1-peng.ma@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318025354.6447-1-peng.ma@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/03/2020 10:53:54+0800, Peng Ma wrote:
> This patch enables ACPI support in Rtc Flex timer driver.
> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
