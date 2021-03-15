Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C508B33C8FF
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 23:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhCOWDq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 18:03:46 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51837 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhCOWDk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 18:03:40 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0094CC0005;
        Mon, 15 Mar 2021 22:03:38 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Heiko Schocher <hs@denx.de>, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Teresa Remmet <t.remmet@phytec.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rv3028: correct weekday register usage
Date:   Mon, 15 Mar 2021 23:03:38 +0100
Message-Id: <161584580809.569012.16013682720509082493.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210309134719.1494062-1-hs@denx.de>
References: <20210309134719.1494062-1-hs@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 9 Mar 2021 14:47:19 +0100, Heiko Schocher wrote:
> The datasheet for the rv3028 says the weekday has exact 3 bits
> and in chapter 3.4.0 for the "3h–Weekday" register it says:
> """
> This register holds the current day of the week. Each value represents
> one weekday that is assigned by the user. Values will range from 0 to 6
> The weekday counter is simply a 3-bit counter which counts up to 6
> and then resets to 0.
> """
> 
> [...]

Applied, thanks!

[1/1] rtc: rv3028: correct weekday register usage
      commit: 6e00b6d0083ea5f529b057e87c0236747871b6a8

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
