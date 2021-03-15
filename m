Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598C533C895
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 22:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhCOVjq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 17:39:46 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55437 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhCOVjb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 17:39:31 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2DF6BC0006;
        Mon, 15 Mar 2021 21:39:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: tps65910: include linux/property.h
Date:   Mon, 15 Mar 2021 22:39:29 +0100
Message-Id: <161584435150.563923.1227213973042942191.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210225134215.2263694-1-arnd@kernel.org>
References: <20210225134215.2263694-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 25 Feb 2021 14:42:04 +0100, Arnd Bergmann wrote:
> The added device_property_present() call causes a build
> failure in some configurations because of the missing header:
> 
> drivers/rtc/rtc-tps65910.c:422:7: error: implicit declaration of function 'device_property_present' [-Werror,-Wimplicit-function-declaration]

Applied, thanks!

[1/1] rtc: tps65910: include linux/property.h
      commit: 936d3685e62436a378f02b8b74759b054d4aeca1

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
