Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABF43AE02F
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 22:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTUWw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 16:22:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44461 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhFTUWv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 16:22:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CD9ED1BF207;
        Sun, 20 Jun 2021 20:20:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        rdunlap@infradead.org, a.zummo@towertech.it
Subject: Re: [PATCH -next resend] rtc: m41t80: correct function names in rtc-m41t80.c
Date:   Sun, 20 Jun 2021 22:20:33 +0200
Message-Id: <162422042126.1087482.13708001740337382284.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517110641.473386-1-yangyingliang@huawei.com>
References: <20210517110641.473386-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 17 May 2021 19:06:41 +0800, Yang Yingliang wrote:
> Fix the following make W=1 kernel build warnings:
> 
>   drivers/rtc/rtc-m41t80.c:811: warning: expecting prototype for wdt_close(). Prototype was for wdt_release() instead
>   drivers/rtc/rtc-m41t80.c:830: warning: expecting prototype for notify_sys(). Prototype was for wdt_notify_sys() instead

Applied, thanks!

[1/1] rtc: m41t80: correct function names in rtc-m41t80.c
      commit: b958da7919e2c325ba8c6e34c947f745e5c66cef

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
