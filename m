Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C70F28188
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 17:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730760AbfEWPpe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 11:45:34 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50115 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfEWPpe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 May 2019 11:45:34 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1F1ACFF803;
        Thu, 23 May 2019 15:45:27 +0000 (UTC)
Date:   Thu, 23 May 2019 17:45:27 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     roman.stratiienko@globallogic.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: test: enable wakeup flags
Message-ID: <20190523154527.GV3274@piout.net>
References: <20190515142022.15019-1-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515142022.15019-1-roman.stratiienko@globallogic.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/05/2019 17:20:22+0300, roman.stratiienko@globallogic.com wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> Alarmtimer interface uses only the RTC with wekeup flags enabled.
> Allow to use rtc-test driver with alarmtimer interface.
> 
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> ---
> Changes in v2:
> 
> Wakeup flags applied only for the RTCs with alarm support
> 
>  drivers/rtc/rtc-test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
