Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DE2416634
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 21:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243060AbhIWTvn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 15:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243055AbhIWTvn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 15:51:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88D4F61241;
        Thu, 23 Sep 2021 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632426611;
        bh=KPbsz/qJYXfgaT8Ml8f4/sHgQtXgEvBVnnKSfrfFbsY=;
        h=From:To:Cc:Subject:Date:From;
        b=A7pzboNFK911E35CPSfLMPAeudHhEKdMMUQCuIVNImIjdhK0MtkkrbZ1HpJpZ7Ub8
         KvlNKR19x0VfxTPIvBPtoaQIdNsOXGKpebjab8KWQmm5za02hsSr/CrULMvL0QadeN
         mP3hX/p0YbUGh0f0iKGsgHcn4gEtLNelRfxYJY4UpTnKZerOvIaa9MBjlmP9NzRMd0
         LW3vedUOZ/8SxsbRX41LViD4brlsFXIVTOxCrqAlgFkrfhM5z7OZLpKlAOc+afb4+f
         vs/FEJ3ouM5NhRyQhpE+9i4HcFBM7bJKHjU3DjgSpKGbMcCxAMfWo3I4YuJrdu0WE4
         wDC1b0uDVPLsQ==
From:   Mark Brown <broonie@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 0/3] rtc: Ensure DT compatibles have SPI device IDs
Date:   Thu, 23 Sep 2021 20:49:19 +0100
Message-Id: <20210923194922.53386-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=635; h=from:subject; bh=KPbsz/qJYXfgaT8Ml8f4/sHgQtXgEvBVnnKSfrfFbsY=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNo+DxKbanpHU6Y5tWhKEfSohO0f5gTvgJuZK+eg JYbGRYyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaPgAKCRAk1otyXVSH0LJLB/ 4o1Gq5M9fLbcY9hEmZr3jCaMDNXo7x3fEf/+KgahZr73QOwhes8Uy+l57lzhsexatf56QIvYRbropz hcGhlHjJjPFPxxwrORWtYyXjckEQf+PUlU0v0M4vdTzZBFCmcfYHDC1WxWxbP1RwUnQwOEpMyO4xxO okfpoCytIqp06/hC2r6dv+gS9FhVYjwNKgQw+Se/SVN0mIGFUk4y0+oH/STt0pSreHseDRaV5tHguw /gHH8fEsm2N+3OB+Vu3AOy0njqMf1EdNdwU2LmozLWgZe5Ar4zeRrZaV5eqCQfN7VK02fOXCeXWl/F GrRddEV/T910r/STdtZgeG/QKw7lfr
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so this series
adds SPI IDs where they aren't provided for a given modalias.

Mark Brown (3):
  rtc: ds1302: Add SPI ID table
  rtc: ds1390: Add SPI ID table
  rtc: pcf2123: Add SPI ID table

 drivers/rtc/rtc-ds1302.c  | 7 +++++++
 drivers/rtc/rtc-ds1390.c  | 7 +++++++
 drivers/rtc/rtc-pcf2123.c | 9 +++++++++
 3 files changed, 23 insertions(+)


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
-- 
2.20.1

