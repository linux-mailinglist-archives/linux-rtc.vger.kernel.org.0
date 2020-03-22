Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8286A18ECB5
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCVVde (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:33:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38781 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgCVVde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:33:34 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CD3C320003;
        Sun, 22 Mar 2020 21:33:31 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:33:31 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?B?6Z+p56eR5omN?= <hankecai@vivo.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org, kernel@vivo.com
Subject: Re: [PATCH] rtc: pm8xxx: clear alarm register when alarm is not
 enabled
Message-ID: <20200322213331.GI221863@piout.net>
References: <APoAZgAaCEiRpKG6PlzreaqE.1.1584791417367.Hmail.hankecai@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <APoAZgAaCEiRpKG6PlzreaqE.1.1584791417367.Hmail.hankecai@vivo.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/03/2020 19:50:17+0800, 韩科才 wrote:
> Clear alarm register when alarm is not enabled otherwise the consumer
> may still start alarm timer if it find the alarm register is not zero.
> 
> Signed-off-by: hankecai <hankecai@vivo.com>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c

Because the other one doesn't apply, I've applied that one.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
