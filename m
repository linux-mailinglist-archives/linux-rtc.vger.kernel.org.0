Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6477F409B16
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Sep 2021 19:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245558AbhIMRlP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Sep 2021 13:41:15 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52401 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345360AbhIMRlI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Sep 2021 13:41:08 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DE19E240006;
        Mon, 13 Sep 2021 17:39:50 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, Yu-Tung Chang <mtwget@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rx8010: select REGMAP_I2C
Date:   Mon, 13 Sep 2021 19:39:46 +0200
Message-Id: <163155475974.409020.15867629365213946463.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830052532.40356-1-mtwget@gmail.com>
References: <20210830052532.40356-1-mtwget@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 30 Aug 2021 13:25:32 +0800, Yu-Tung Chang wrote:
> The rtc-rx8010 uses the I2C regmap but doesn't select it in Kconfig so
> depending on the configuration the build may fail. Fix it.
> 
> 

Applied, thanks!

[1/1] rtc: rx8010: select REGMAP_I2C
      commit: 0c45d3e24ef3d3d87c5e0077b8f38d1372af7176

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
