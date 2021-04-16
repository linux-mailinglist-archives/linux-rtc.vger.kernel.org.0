Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AFC362ACB
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235703AbhDPWJd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:09:33 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33019 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbhDPWJd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:09:33 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BEC6BC0005;
        Fri, 16 Apr 2021 22:09:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, Liam Beguin <liambeguin@gmail.com>,
        panfilov.artyom@gmail.com
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] add alarm support for the rtc-ab-eoz9
Date:   Sat, 17 Apr 2021 00:09:06 +0200
Message-Id: <161861084945.863955.12310930275996788222.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408024028.3526564-1-liambeguin@gmail.com>
References: <20210408024028.3526564-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 7 Apr 2021 22:40:25 -0400, Liam Beguin wrote:
> Add alarm support for the rtc-ab-eoz9.
> 
> The board used to test this series has the interrupt line of the RTC
> connected to a circuit controlling the power of the board.
> 
> An event on the interrupt line while the board is off will power it on.
> Because of these hardware limitations, the irq handler added in this
> patch wasn't fully tested.
> 
> [...]

Applied, thanks!

[1/3] rtc: ab-eoz9: set regmap max_register
      commit: f1d304766c7f5388239d273fc0b72efa62acd9ca
[2/3] rtc: ab-eoz9: add alarm support
      commit: e70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370
[3/3] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
      commit: c52409eb16672907804b7acf1658bb1fd9dcb426

I would still have preferred the last two to be squashed but I've been slow to
reply and we are late in the cyle.

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
