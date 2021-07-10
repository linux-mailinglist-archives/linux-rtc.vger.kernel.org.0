Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5CD3C2C28
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 02:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhGJApW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 20:45:22 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38405 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGJApW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 20:45:22 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D1EDE200002;
        Sat, 10 Jul 2021 00:42:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] rtc: s5m: Check return value of s5m_check_peding_alarm_interrupt()
Date:   Sat, 10 Jul 2021 02:42:34 +0200
Message-Id: <162587774658.1208259.11635583040730413749.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 8 Jul 2021 14:13:04 +0900, Nobuhiro Iwamatsu wrote:
> s5m_check_peding_alarm_interrupt() in s5m_rtc_read_alarm() gets the return
> value, but doesn't use it.
> This modifies using the s5m_check_peding_alarm_interrupt()"s return value
> as the s5m_rtc_read_alarm()'s return value.

Applied, thanks!

[1/1] rtc: s5m: Check return value of s5m_check_peding_alarm_interrupt()
      commit: f2581b1dfa9858e342afa8034b0f64f923bbf233

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
