Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E902B312B
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 23:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKNWbq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 17:31:46 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37403 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKNWbq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 17:31:46 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3EF4B240003;
        Sat, 14 Nov 2020 22:31:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it,
        "xiakaixu1987@gmail.com" <xiakaixu1987@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kaixu Xia <kaixuxia@tencent.com>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: da9063: Simplify bool comparison
Date:   Sat, 14 Nov 2020 23:31:43 +0100
Message-Id: <160539309317.847457.7971248340408878350.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1604649637-1014-1-git-send-email-kaixuxia@tencent.com>
References: <1604649637-1014-1-git-send-email-kaixuxia@tencent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 6 Nov 2020 16:00:37 +0800, xiakaixu1987@gmail.com wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/rtc/rtc-da9063.c:246:5-18: WARNING: Comparison to bool

Applied, thanks!

[1/1] rtc: da9063: Simplify bool comparison
      commit: a48c6224ae07bed02893c58073ca2942acb5c3d5

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
