Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE7FDBE6
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2019 12:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfKOLBi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Nov 2019 06:01:38 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37475 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOLBi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Nov 2019 06:01:38 -0500
X-Originating-IP: 90.66.177.178
Received: from localhost (lfbn-1-2888-178.w90-66.abo.wanadoo.fr [90.66.177.178])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2C9A840011;
        Fri, 15 Nov 2019 11:01:36 +0000 (UTC)
Date:   Fri, 15 Nov 2019 12:01:36 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8563: Constify clkout_rates
Message-ID: <20191115110136.GQ3572@piout.net>
References: <20191108002449.15097-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108002449.15097-1-iwamatsu@nigauri.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2019 09:24:49+0900, Nobuhiro Iwamatsu wrote:
> The lates of clockout should be marked const. Make that so.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-pcf8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
