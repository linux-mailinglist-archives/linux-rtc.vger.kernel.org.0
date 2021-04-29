Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D324636F209
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 23:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhD2Vak (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 17:30:40 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44119 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbhD2Vak (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Apr 2021 17:30:40 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 06E391BF204;
        Thu, 29 Apr 2021 21:29:51 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: omap: use rtc_write to access OMAP_RTC_OSC_REG
Date:   Thu, 29 Apr 2021 23:29:49 +0200
Message-Id: <161973168395.2582973.9374098143035295509.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210425145924.23353-1-dariobin@libero.it>
References: <20210425145924.23353-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 25 Apr 2021 16:59:23 +0200, Dario Binacchi wrote:
> The RTC_OSC_REG register is 32-bit, but the useful information is found
> in the 7 least significant bits (bits 7-31 are reserved). And in fact,
> as you can see from the code, all read accesses are 8-bit, as well as
> some writes. Let's make sure all writes are 8-bit. Moreover, in contexts
> where consecutive reads / writes after the busy check must take place
> within 15 us, it is better not to waste time on useless accesses.

I really doubt writeb versus writel actually make a difference as the bus will
probably still do a 32bit access.

Applied, thanks!

[1/1] rtc: omap: use rtc_write to access OMAP_RTC_OSC_REG
      commit: 50f2cc7f758cdbc7c8f928edc25b1c7bc09ef3e2

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
