Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25BF8A8B6
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfHLU5j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 16:57:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55087 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfHLU5j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 16:57:39 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DEDD120007;
        Mon, 12 Aug 2019 20:57:36 +0000 (UTC)
Date:   Mon, 12 Aug 2019 22:57:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 14/16] rtc: remove w90x900/nuc900 driver
Message-ID: <20190812205736.GT3600@piout.net>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-15-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-15-arnd@arndb.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/08/2019 22:27:42+0200, Arnd Bergmann wrote:
> The ARM w90x900 platform is getting removed, so this driver is obsolete.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/rtc/Kconfig      |   7 -
>  drivers/rtc/Makefile     |   1 -
>  drivers/rtc/rtc-nuc900.c | 271 ---------------------------------------
>  3 files changed, 279 deletions(-)
>  delete mode 100644 drivers/rtc/rtc-nuc900.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
