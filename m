Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F64362BD5
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 01:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhDPXPj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 19:15:39 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60123 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDPXPj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 19:15:39 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B9B98FF805;
        Fri, 16 Apr 2021 23:15:12 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: remove unused function
Date:   Sat, 17 Apr 2021 01:15:12 +0200
Message-Id: <161861490647.878360.6058660269915278290.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1618475821-102974-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1618475821-102974-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 15 Apr 2021 16:37:01 +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
> 
> drivers/rtc/rtc-ds1511.c:108:1: warning: unused function
> 'rtc_write_alarm' [-Wunused-function].

Applied, thanks!

[1/1] rtc: remove unused function
      commit: ef062a45ec9c2b6d15ddd9f76f897219334c7cd2

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
