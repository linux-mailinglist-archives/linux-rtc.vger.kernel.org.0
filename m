Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356FE2CE1FC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 23:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbgLCWmR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 17:42:17 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37809 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728973AbgLCWmR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 17:42:17 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C893CFF802;
        Thu,  3 Dec 2020 22:41:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johannes Berg <johannes@sipsolutions.net>,
        linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-um@lists.infradead.org
Subject: Re: [PATCH] rtc: enable RTC framework on ARCH=um
Date:   Thu,  3 Dec 2020 23:41:33 +0100
Message-Id: <160703528647.99810.8924384359041408113.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120211103.6895ac740d11.Ic19a9926e8e4c70c03329e55f9e5b1d45095b904@changeid>
References: <20201120211103.6895ac740d11.Ic19a9926e8e4c70c03329e55f9e5b1d45095b904@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 20 Nov 2020 21:11:06 +0100, Johannes Berg wrote:
> There's no real reason it should be disabled, and at least we can
> use it for development & testing with the RTC test driver.
> 
> However, two devices are missing a HAS_IOMEM dependency, so add
> that to avoid build failures from e.g. allyesconfig.

Applied, thanks!

[1/1] rtc: enable RTC framework on ARCH=um
      commit: 9c7957991e56291c59803cf0412127ae7177beac

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
