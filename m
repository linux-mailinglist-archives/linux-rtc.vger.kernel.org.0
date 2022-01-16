Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88EF48FF91
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jan 2022 23:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbiAPW6a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Jan 2022 17:58:30 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:46241 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236401AbiAPW63 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Jan 2022 17:58:29 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6A94D240002;
        Sun, 16 Jan 2022 22:58:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        vincent.sunplus@gmail.com, a.zummo@towertech.it
Subject: Re: [PATCH -next] rtc: rtc-sunplus: fix return value in sp_rtc_probe()
Date:   Sun, 16 Jan 2022 23:58:22 +0100
Message-Id: <164237389104.3519935.13650173996002383472.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106075711.3216468-1-yangyingliang@huawei.com>
References: <20220106075711.3216468-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 6 Jan 2022 15:57:11 +0800, Yang Yingliang wrote:
> If devm_ioremap_resource() fails, it should return error
> code from sp_rtc->reg_base in sp_rtc_probe().
> 
> 

Applied, thanks!

[1/1] rtc: rtc-sunplus: fix return value in sp_rtc_probe()
      commit: 5ceee540fdc7f1d65ca6e2b1b193ce5aa95ab99c

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
