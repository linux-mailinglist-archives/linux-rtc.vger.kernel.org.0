Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0E510A666
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2019 23:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfKZWOM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Nov 2019 17:14:12 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55561 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfKZWOM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Nov 2019 17:14:12 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4D95CFF809;
        Tue, 26 Nov 2019 22:14:05 +0000 (UTC)
Date:   Tue, 26 Nov 2019 23:14:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Kevin Hilman <khilman@baylibre.com>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: meson: remove redundant assignment to variable
 retries
Message-ID: <20191126221404.GT299836@piout.net>
References: <20191122225210.109172-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122225210.109172-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/11/2019 22:52:10+0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable retries is being initialized with a value that is never
> read and it is being updated later with a new value in a for-loop.
> The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
