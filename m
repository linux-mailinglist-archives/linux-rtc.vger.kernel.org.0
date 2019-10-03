Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6902FCAF8A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 21:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfJCTu1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 15:50:27 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:57259 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729616AbfJCTu1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 15:50:27 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7119540002;
        Thu,  3 Oct 2019 19:50:25 +0000 (UTC)
Date:   Thu, 3 Oct 2019 21:50:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     a.zummo@towertech.it, nicolas.ferre@microchip.com,
        ludovic.desroches@microchip.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rtc: at91rm9200: use of_device_get_match_data()
Message-ID: <20191003195025.GJ575@piout.net>
References: <1569500132-21164-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569500132-21164-1-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/09/2019 15:15:32+0300, Claudiu Beznea wrote:
> Use of_device_get_match_data() since all platforms should now use DT
> bindings. AVR32 architecture has been removed in
> commit 26202873bb51 ("avr32: remove support for AVR32 architecture").
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/rtc/Kconfig          |  1 +
>  drivers/rtc/rtc-at91rm9200.c | 19 +------------------
>  2 files changed, 2 insertions(+), 18 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
