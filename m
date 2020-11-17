Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3152B71EF
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Nov 2020 00:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgKQXBt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 18:01:49 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37253 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgKQXBs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 18:01:48 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E50C8240006;
        Tue, 17 Nov 2020 23:01:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: destroy mutex when releasing the device
Date:   Wed, 18 Nov 2020 00:01:46 +0100
Message-Id: <160565409748.1333140.11338641137838179554.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110094205.8972-1-brgl@bgdev.pl>
References: <20201110094205.8972-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 10 Nov 2020 10:42:05 +0100, Bartosz Golaszewski wrote:
> Not destroying mutexes doesn't lead to resource leak but it's the correct
> thing to do for mutex debugging accounting.

Applied, thanks!

[1/1] rtc: destroy mutex when releasing the device
      commit: b3527837a60a5dcd0c16c28804b6ec9b47f15947

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
