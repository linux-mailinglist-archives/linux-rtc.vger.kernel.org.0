Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103FA196FCD
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2020 22:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgC2UEk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Mar 2020 16:04:40 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:59787 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgC2UEk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Mar 2020 16:04:40 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E33F5240004;
        Sun, 29 Mar 2020 20:04:38 +0000 (UTC)
Date:   Sun, 29 Mar 2020 22:04:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     leoyang.li@nxp.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com
Subject: Re: [PATCH] rtc: flextimer: report interrupt state to user mode
Message-ID: <20200329200438.GA730760@piout.net>
References: <20200327084457.45161-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327084457.45161-1-biwen.li@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/03/2020 16:44:57+0800, Biwen Li wrote:
> Report interrupt state to user mode
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
Applied, thanks. I reworked the commit message because the alarm is not
necessarily going to userspace.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
