Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC2027D7E3
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Sep 2020 22:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgI2US1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Sep 2020 16:18:27 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51143 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgI2US1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Sep 2020 16:18:27 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4850BC0002;
        Tue, 29 Sep 2020 20:18:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] rtc: rx8010: rename rx8010_init_client() to rx8010_init()
Date:   Tue, 29 Sep 2020 22:18:24 +0200
Message-Id: <160141069063.2801819.5210463187101994613.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917114656.9036-1-brgl@bgdev.pl>
References: <20200917114656.9036-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 17 Sep 2020 13:46:56 +0200, Bartosz Golaszewski wrote:
> Since the switch to using regmap this function no longer takes the
> I2C client struct as argument nor do we even interact with the client
> anywhere other than when creating the regmap.
> 
> Rename it to a less misleading name: "rx8010_init()".

Applied, thanks!

[1/1] rtc: rx8010: rename rx8010_init_client() to rx8010_init()
      commit: ba1bcafb29571f525bf563972e4241998db74e98

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
