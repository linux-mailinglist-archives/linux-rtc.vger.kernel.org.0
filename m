Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FE54184AE
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 23:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhIYVbe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 17:31:34 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48023 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhIYVbe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 17:31:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7936924000A;
        Sat, 25 Sep 2021 21:29:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] rtc: omap: drop unneeded MODULE_ALIAS
Date:   Sat, 25 Sep 2021 23:29:53 +0200
Message-Id: <163260532289.37353.5313230409498030745.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
References: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 16 Sep 2021 18:45:12 +0200, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
> 
> 

Applied, thanks!

[1/2] rtc: omap: drop unneeded MODULE_ALIAS
      commit: 5e295f9402039aaa38d0949f598745b98850fd13
[2/2] rtc: s5m: drop unneeded MODULE_ALIAS
      commit: 6eee1c48be7cb0b9b14408521a9151c1021901d3

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
