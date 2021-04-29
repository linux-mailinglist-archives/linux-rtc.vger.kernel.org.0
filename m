Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6795736F20E
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 23:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237293AbhD2Vas (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 17:30:48 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38683 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbhD2Var (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Apr 2021 17:30:47 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1B34C1BF204;
        Thu, 29 Apr 2021 21:29:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: ds1307: Fix wday settings for rx8130
Date:   Thu, 29 Apr 2021 23:29:51 +0200
Message-Id: <161973168394.2582973.4174648734341158108.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420023917.1949066-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210420023917.1949066-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 20 Apr 2021 11:39:17 +0900, Nobuhiro Iwamatsu wrote:
> rx8130 wday specifies the bit position, not BCD.

Applied, thanks!

[1/1] rtc: ds1307: Fix wday settings for rx8130
      commit: a2cd545784d06f0ce88a21ba17a9653d2cd98d88

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
