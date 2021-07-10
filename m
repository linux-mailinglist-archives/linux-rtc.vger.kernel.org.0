Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD03C2C27
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 02:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhGJApU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 20:45:20 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48109 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGJApU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 20:45:20 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 139C1E0005;
        Sat, 10 Jul 2021 00:42:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] rtc: at91sam9: Remove unnecessary offset variable checks
Date:   Sat, 10 Jul 2021 02:42:33 +0200
Message-Id: <162587774658.1208259.17811881345824308295.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708051340.341345-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210708051340.341345-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 8 Jul 2021 14:13:40 +0900, Nobuhiro Iwamatsu wrote:
> The offset variable is checked by at91_rtc_readalarm(), but this check
> is unnecessary because the previous check knew that the value of this
> variable was not 0.
> This removes that unnecessary offset variable checks.

Applied, thanks!

[1/1] rtc: at91sam9: Remove unnecessary offset variable checks
      commit: 37aadf9b2a7ea64a358ea7532d7f477fe6837ef1

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
