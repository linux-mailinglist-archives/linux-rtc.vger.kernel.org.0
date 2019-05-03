Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97E11317F
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 17:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfECPxG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 11:53:06 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54449 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfECPxG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 11:53:06 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id ECAF2C000E;
        Fri,  3 May 2019 15:53:02 +0000 (UTC)
Date:   Fri, 3 May 2019 17:53:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     a.zummo@towertech.it, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: imxdi: remove unused variable
Message-ID: <20190503155302.GF22550@piout.net>
References: <20190503154217.13205-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190503154217.13205-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/05/2019 17:42:17+0200, Anders Roxell wrote:
> This variable is no longer used and the compiler rightly complains that
> it should be removed.
> 
> ../drivers/rtc/rtc-imxdi.c: In function ‘dryice_rtc_set_alarm’:
> ../drivers/rtc/rtc-imxdi.c:633:16: warning: unused variable ‘now’ [-Wunused-variable]
>   unsigned long now;
>                 ^~~
> 
> Rework to remove the unused variable.
> 
> Fixes: 629d488a3eb6 ("rtc: imxdi: remove unnecessary check")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/rtc/rtc-imxdi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
