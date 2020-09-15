Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5198826A219
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 11:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgIOJZN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 05:25:13 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58893 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOJZL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 05:25:11 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9D09620004;
        Tue, 15 Sep 2020 09:25:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: ds1685: Fix bank switching to avoid endless loop
Date:   Tue, 15 Sep 2020 11:25:09 +0200
Message-Id: <160016189229.325843.7460922638865008658.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910084124.138560-1-tsbogend@alpha.franken.de>
References: <20200910084124.138560-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 10 Sep 2020 10:41:24 +0200, Thomas Bogendoerfer wrote:
> ds1685_rtc_begin_data_access() tried to access an extended register before
> enabling access to it by switching to bank 1. Depending on content in NVRAM
> this could lead to an endless loop. While at it fix also switch back to
> bank 0 in ds1685_rtc_end_data_access().

Applied, thanks!

[1/1] rtc: ds1685: Fix bank switching to avoid endless loop
      commit: 9f8010e71f091b0609452742cfed4650ee633c44

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
