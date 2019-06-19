Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1734BBC4
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2019 16:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfFSOgU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Jun 2019 10:36:20 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38825 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfFSOgT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Jun 2019 10:36:19 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D071F1BF20D;
        Wed, 19 Jun 2019 14:36:15 +0000 (UTC)
Date:   Wed, 19 Jun 2019 16:36:15 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dylan Howey <Dylan.Howey@tennantco.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] rtc: pcf2123: remove sysfs register view
Message-ID: <20190619143615.GP23549@piout.net>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/05/2019 19:52:08+0000, Dylan Howey wrote:
> Use regmap debugfs register view instead.
> 
> Signed-off-by: Dylan Howey <Dylan.Howey@tennantco.com>
> ---
>  drivers/rtc/rtc-pcf2123.c | 90 +--------------------------------------
>  1 file changed, 1 insertion(+), 89 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
