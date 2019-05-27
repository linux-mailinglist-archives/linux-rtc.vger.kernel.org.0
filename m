Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90872B1E3
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 12:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfE0KOJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 06:14:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35870 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE0KOJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 06:14:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id s17so16376255wru.3;
        Mon, 27 May 2019 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmYyXClEyhCB/k7IkxkZpBXMb+GcpwSLAb7EW1GLi88=;
        b=I3oyGoSLMpNOl0adhWiJdseBKUmXiEfkBQCy4WrjmAF8wMRV8ogrVD1gUZxw5x7ZZh
         c7ar2ecnLchcZ8xzZC9cjgwqc2P8UrtWOZnqWiS/NQXm4kg/hZ5yqOP69lekentAl2pH
         RBHssHXASRuE8WtSC4T+xPhS3s3bUBr+DbrZmJyy/qa75w7qQVVav15nXBg0nf/qlDR3
         gIHI/Os6RlqPkA5zJQdxZNsSajM0gajnaXvkgmcXW/p5tq9Qod4In8XZL8fuMcIpWkFw
         BunJV+wn9yzgAicFX2NA7X8eKKpVpfU8WnC3WzH2guGuKTkR0wlzYhFtU1A5ro/8l6Pk
         +HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmYyXClEyhCB/k7IkxkZpBXMb+GcpwSLAb7EW1GLi88=;
        b=og5dkJ3EEgNYUhFWKcJHIc9NeAp/cZ0CBHnVEI+hSv7/ikFfTrQqB/8NayJ8q78rsR
         8oJCDIiOqmzl4nqjwrPlFguPcGR4igrrd5JkfEHOfIrYKcVvzKNbvun7ucX9jJYqjTdy
         CZ8eB/Ea8g4z16IGmDrzN6M5IVNiSJFjb1bZVpr6Lv+QeNQiciJQhUZ86jOqAFusTber
         ZI6YYvaFZ8Sov/z+pbxtyIL5IICro0dQ9OYJPHhHL6sER8BB1SsEXKF3uzms8LsvyTxL
         PnAWeXXRT4ZI185MqAcnFA+TD3hyu1tu99Y96j/Cq5NOh3UTgtIHFeVBy1Z2uo9twXYt
         HkKw==
X-Gm-Message-State: APjAAAXE48IF+S9FwI9xFRDe/38LqwaaVvk109RQXVVOeIXIUilUY/Hs
        8t11qVvJA8J0WkbbQPR0hd8=
X-Google-Smtp-Source: APXvYqxhPOJCwQVz46MEKCJymC6evZIIV7z7pSiVare5OCVTssJlh1PTBDczLKmzHQL3arHbuREiqw==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr6408503wru.117.1558952046820;
        Mon, 27 May 2019 03:14:06 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s9sm3443171wmc.1.2019.05.27.03.14.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:14:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] rtc: tegra: Dust off and deferred probe support
Date:   Mon, 27 May 2019 12:13:56 +0200
Message-Id: <20190527101359.5898-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra RTC driver has accumulated a bit of dust over the
years. Make a pass over it, addressing checkpatch warnings and fixing
some inconsistencies in comments and kernel messages as well as in
variable types and names.

Once cleaned up, also turn the driver into a regular driver in order
to support deferred probe which is needed to avoid a future regression
on Tegra186 and later.

Thierry

Thierry Reding (3):
  rtc: tegra: checkpatch and miscellaneous cleanups
  rtc: tegra: Use consistent variable names and types
  rtc: tegra: Turn into regular driver

 drivers/rtc/rtc-tegra.c | 254 ++++++++++++++++++++--------------------
 1 file changed, 128 insertions(+), 126 deletions(-)

-- 
2.21.0

