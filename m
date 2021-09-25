Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500D44184B0
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 23:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhIYVbf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 17:31:35 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50815 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhIYVbe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 17:31:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 76281E0002;
        Sat, 25 Sep 2021 21:29:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] rtc: rx6110: simplify getting the adapter of a client
Date:   Sat, 25 Sep 2021 23:29:54 +0200
Message-Id: <163260532289.37353.2554832700700385175.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
References: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 18 Sep 2021 23:35:51 +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> 

Applied, thanks!

Note that the DKIM-Signature verification failed for that patch

[1/2] rtc: rx6110: simplify getting the adapter of a client
      commit: 38b17bc9c40e8f3138b02c624d9063b6781c8150

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
