Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EF42B3129
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 23:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgKNWai (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 17:30:38 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57087 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKNWai (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 17:30:38 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9529E60002;
        Sat, 14 Nov 2020 22:30:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it,
        "xiakaixu1987@gmail.com" <xiakaixu1987@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: Re: [PATCH] rtc: sc27xx: Remove unnecessary conversion to bool
Date:   Sat, 14 Nov 2020 23:30:35 +0100
Message-Id: <160539301049.847178.9602730906978910840.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1604647854-876-1-git-send-email-kaixuxia@tencent.com>
References: <1604647854-876-1-git-send-email-kaixuxia@tencent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 6 Nov 2020 15:30:54 +0800, xiakaixu1987@gmail.com wrote:
> Here we could use the '!=' expression to fix the following coccicheck
> warning:
> 
> ./drivers/rtc/rtc-sc27xx.c:566:50-55: WARNING: conversion to bool not needed here

Applied, thanks!

[1/1] rtc: sc27xx: Remove unnecessary conversion to bool
      commit: 825156a5eeded9bcb55e9c36d4b4b72bf20bcba6

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
