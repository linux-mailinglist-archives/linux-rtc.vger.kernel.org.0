Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153C527D82F
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Sep 2020 22:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgI2Uar (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Sep 2020 16:30:47 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:58162 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgI2Uar (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Sep 2020 16:30:47 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id DAEF53AA265;
        Tue, 29 Sep 2020 20:20:40 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D0859200002;
        Tue, 29 Sep 2020 20:20:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liu Shixin <liushixin2@huawei.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH -next] rtc: rv8803: simplify the return expression of rv8803_nvram_write
Date:   Tue, 29 Sep 2020 22:20:18 +0200
Message-Id: <160141081036.2802494.16431017614057065135.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921082449.2591981-1-liushixin2@huawei.com>
References: <20200921082449.2591981-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 21 Sep 2020 16:24:49 +0800, Liu Shixin wrote:
> Simplify the return expression.

Applied, thanks!

[1/1] rtc: rv8803: simplify the return expression of rv8803_nvram_write
      commit: 179b4bcc4c0cf62e3737c718e05f5a69b3e9041c

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
