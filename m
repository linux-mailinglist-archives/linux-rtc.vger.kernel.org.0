Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408692F3F70
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 01:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbhALWri (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 17:47:38 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59013 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730174AbhALWri (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 17:47:38 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A518D1BF203;
        Tue, 12 Jan 2021 22:46:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, Guixiong Wei <guixiong@codeaurora.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pm8xxx: Read ALARM_EN and update to alarm enabled status
Date:   Tue, 12 Jan 2021 23:46:56 +0100
Message-Id: <161049160654.346368.10438206173651410063.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1608809337-18852-1-git-send-email-guixiong@codeaurora.org>
References: <1608809337-18852-1-git-send-email-guixiong@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 24 Dec 2020 19:28:57 +0800, Guixiong Wei wrote:
> ALARM_EN status is retained in PMIC register after device shutdown
> if poweron_alarm is enabled. Read it to make sure the driver has
> consistent value with the register status.

Applied, thanks!

[1/1] rtc: pm8xxx: Read ALARM_EN and update to alarm enabled status
      commit: 121f54efc3fb9854f581fede4f719a4aef7ed5b3

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
