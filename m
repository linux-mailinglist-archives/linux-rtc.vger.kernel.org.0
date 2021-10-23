Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF44385A4
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Oct 2021 23:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhJWWBQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Oct 2021 18:01:16 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:54635 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhJWWBO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Oct 2021 18:01:14 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1703A240002;
        Sat, 23 Oct 2021 21:58:51 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] rtc: s3c: S3C driver improvements
Date:   Sat, 23 Oct 2021 23:58:51 +0200
Message-Id: <163502632457.411308.6365977083733513077.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021202256.28517-1-semen.protsenko@linaro.org>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 21 Oct 2021 23:22:53 +0300, Sam Protsenko wrote:
> While working on Exynos850 support (where this driver works fine in its
> current state), I've stumbled upon some minor issue. This is the effort
> to fix those.
> 
>   * [PATCH 1/3]: moves S3C RTC driver to newer API usage
>     (no functional changes)
>   * [PATCH 2/3]: refactoring/cleanup (no functional changes)
>   * [PATCH 3/3]: adds time range, as [PATCH 1/3] made it possible
> 
> [...]

Applied, thanks!

[1/3] rtc: s3c: Remove usage of devm_rtc_device_register()
      commit: dba28c37f23a09fc32dbc37463ddb2feb3886f98
[2/3] rtc: s3c: Extract read/write IO into separate functions
      commit: e4a1444e10cbda2892a4ea7325ef5efa47c75cfb
[3/3] rtc: s3c: Add time range
      commit: a5feda3b361e11b291786d5c4ff86d4b9a55498f

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
