Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DCDF5050
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 16:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHP4l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 10:56:41 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:56511 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfKHP4l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 10:56:41 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9B0DCFF803;
        Fri,  8 Nov 2019 15:56:38 +0000 (UTC)
Date:   Fri, 8 Nov 2019 16:56:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] rtc: bd70528: fix module alias to autoload module
Message-ID: <20191108155638.GG216543@piout.net>
References: <20191106083418.159045-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106083418.159045-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/11/2019 08:34:18+0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The module alias platform tag contains a spelling mistake. Fix it.
> 
> Fixes: f33506abbcdd ("rtc: bd70528: Add MODULE ALIAS to autoload module")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-bd70528.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
