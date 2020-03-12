Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 568A5183D40
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2020 00:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgCLXVk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 19:21:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47771 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgCLXVk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 19:21:40 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BAB64C0002;
        Thu, 12 Mar 2020 23:21:38 +0000 (UTC)
Date:   Fri, 13 Mar 2020 00:21:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: m48t35: remove SGI-IP27 kludge
Message-ID: <20200312232138.GC3384@piout.net>
References: <20200309123514.15543-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309123514.15543-1-tsbogend@alpha.franken.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/03/2020 13:35:14+0100, Thomas Bogendoerfer wrote:
> With the IOC3 MFD driver it's no longer necessary to special case SGI-IP27.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  drivers/rtc/rtc-m48t35.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
