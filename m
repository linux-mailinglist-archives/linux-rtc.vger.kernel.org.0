Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4B326A209
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 11:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgIOJUj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 05:20:39 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50809 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIOJUh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 05:20:37 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3647860005;
        Tue, 15 Sep 2020 09:20:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 00/14] rtc: rx8010: use regmap instead of i2c smbus API
Date:   Tue, 15 Sep 2020 11:20:34 +0200
Message-Id: <160016161356.324769.2613609111429529281.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 14 Sep 2020 17:45:47 +0200, Bartosz Golaszewski wrote:
> This series gets bigger and bigger but I noticed a problem with this
> driver that looks like stable material so I fixed it as the first patch
> in the series to make backporting easy.
> 
> Other than that, there are new refactoring patches and I removed the
> unnecessary error messages.
> 
> [...]

Applied, thanks!

[01/14] rtc: rx8010: don't modify the global rtc ops
        commit: d3b14296da69adb7825022f3224ac6137eb30abf
[02/14] rtc: rx8010: remove a stray newline
        commit: 2e0ce569102ccb1ca9bacc499c8411fb8fa53069
[03/14] rtc: rx8010: remove unnecessary brackets
        commit: 28c86f30c979f9d4460dd7680610c3470b4d009b
[04/14] rtc: rx8010: consolidate local variables of the same type
        commit: 75677971991940581e76bcd5176ea40d0baf8fcd
[05/14] rtc: rx8010: use tabs instead of spaces for code formatting
        commit: e9e4c2dae4313b88c62ee9df9d177a71c23121b2
[06/14] rtc: rx8010: rename ret to err in rx8010_set_time()
        commit: 13952c9e35384fd7f63a5ce8261108695491bb56
[07/14] rtc: rx8010: don't use magic values for time buffer length
        commit: f702699c67d315e4a232c64801b2de9af87fd9f4
[08/14] rtc: rx8010: drop unnecessary initialization
        commit: b3ff7fd68d925de2159a5312f28dcd178d0d3715
[09/14] rtc: rx8010: use a helper variable for client->dev in probe()
        commit: 955a123c14906e3adc43d43281f8fde91f631f7f
[10/14] rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
        commit: 666f21413b881e159efaf862f119d4d058fa2c4a
[11/14] rtc: rx8010: switch to using the preferred RTC API
        commit: 0ce627785afa730d8f6568eb8738d1700cbc4569
[12/14] rtc: rx8010: switch to using the preferred i2c API
        commit: cee015d90d96495d8376871af0f1a33027303d5e
[13/14] rtc: rx8010: convert to using regmap
        commit: 9868bc1ce272dc0387488e779c585e7a12cf7a1b
[14/14] rtc: rx8010: use range checking provided by core RTC code
        commit: 2fc1af3095af5cbcd8fc406610dc196b62e3ed21

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
