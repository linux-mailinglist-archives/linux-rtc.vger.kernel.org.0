Return-Path: <linux-rtc+bounces-6346-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIykCgis4GkCkwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6346-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:29:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD240C5E3
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CCAC30115B6
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CC63921E6;
	Thu, 16 Apr 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="RpxBDO3o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3ED38F623
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331465; cv=none; b=eP2zNHVB8Rb/jaraM//tEZOdtNujP5W3eu7JOc7DsZrrlpj+kEVKUhZ162gF7mBiPlj8K1IOqKyOJ8LLFo9LVmdvWnFDDd+OVqvpoWolq/EiZFgXJkYSmZcM2yXSw451GBthiy/eboJCEJeAEMvl07/mhCeyJTE7E/Fslkc7k7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331465; c=relaxed/simple;
	bh=0J4qMa92MYYBqwogN7ziM0OP9Jy09ngA4TXLHtrSpxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roJ26dOt1yeVRvWbDjq3ZGWLsarmyKDMCQOOC/PDZgfc3z3rnpT0prSkSWESZ3z45IBEFQej9yGYopE6td4tcf+tVEHfsRKnREoeThwrWrC/7SgjxNFixrA5nm1/+Timk0pC9mFRSEy8+iFKxqAItH5CRl47i19oS31hn+LjXJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=RpxBDO3o; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d5484aa070so554499eec.0
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776331463; x=1776936263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5QM8fvhhwwb++vGNVhGynyKdCfHY+CRlCHIOka3hDOA=;
        b=RpxBDO3oJdqbYOJ86yINLw/lcYVX0RvID9J8xxoRJEco7gK57V6Z+1IFJ3NaVc93xq
         pgSjHaV0QbNnSAruMp19GB+UL79RQIynzCmlevTLfJFltqG9jPJuyxqGeEiKz9XLAlc/
         1QeCHXVLcMmZl/MUufnttgDtHfgGyv4O768P9kCIYPLV0DxPjRQnLv8Kzzif4jvplDHN
         N3bN6659Y7dMl97sjUbVduts5MN0JfYi9yMkHCfeTq896jkASEW3p0YdDjGhG6n6JCcL
         5yIXnO3T1CwKV+vT78vc6QXbDAcAUvWegkno1fJYuf3dpb4/9HsdnSrlST1tQrwzqAWf
         V9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331463; x=1776936263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QM8fvhhwwb++vGNVhGynyKdCfHY+CRlCHIOka3hDOA=;
        b=Mym3N/kux+w9oHuL/TNjYnc5Sfy3FItGUGI+pxBv1DHBPA5ildBxXk9YjxiYSh0jb/
         MFq3cTsGHA4J2RKX5sp2pm4eWp0B1SWNzIMx1l5VOIsKcqgc6JJ+DF7CsXBT9aF+bVq/
         c43oTqG2dXhBxb/idM/KAM2dmKIRjgWdWlsnqbadx97pa2L/OyuWb2A7mfsBrMi5IFPk
         JrZzUcwSRWkr1INln7zcpkvfRKS8lL+bnfd6YoTs81mzNAIHhEfE+aEEy9ek1oqvIj+B
         p9jQ1CtnYV9Jy6T+4mLojSEEJ+7nR8pxfKs9H34elxDV4h2KzooW2Ve5gdPwFev60x9J
         nzLw==
X-Gm-Message-State: AOJu0YyCmrFCkpeENk8/l9T/x8AM0UlsCuqhrF7u8qnhnVd6Ah5W8uJ5
	T2LaHz8LAegtpdbI7AV5wlaei5ZFwTPNg58gwLvv38QT2A1vsKIcKsuW9QE9Ex4Wmw==
X-Gm-Gg: AeBDievTjLLqFUOiKwPZ9HvZrWh8RCB5kvowtUfbM4RaW8sFxEybhQYqPgoXGQSN4jT
	3pNgDe51dw1LOntI6xvmOqFoZfa+kwKw2IIA2mZAqvIxWs3TBD7vzEGerYGvWIHk5od2zHmAD21
	lVIOGRFi+HvMIJeckHNwxoFACbxQ9a//XAx/7pm43AMpAtDgejB16zdsUFBd84Khki74PPT/tqC
	TzrQ5iE3MaUZtWJayKoL4UkfaN7q1trOpdOnfpajJEHW46NEfQQDbzzjsKENEUXBc1qWe6pDn4D
	CWjwaWGzx3bbYPn6Mk/D9zTjCvEwlvYO7nsasyLd2LZoKWVXQi8GGhJ2YyjpAruF9xqsOT91fJS
	ysEslVOan5hFqoWnlxCCFShMwmLZsRElTMB+1qnAeOoXaYeivKags/SNnHYTtPbmZascshvwS4Y
	r5oerpFvAnz5fIuB4BUowIZw+UggysZVHaV7SotJNISHpS4ZEQeJDyGy19dZfIvk5o27ekfQ==
X-Received: by 2002:a05:7301:2b84:b0:2cb:8d2f:e235 with SMTP id 5a478bee46e88-2e172f32c44mr322711eec.1.1776331463070;
        Thu, 16 Apr 2026 02:24:23 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm6423815eec.26.2026.04.16.02.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:24:22 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v1 0/2] rtc: bq32000: Add settle delay for aggressive polling
Date: Thu, 16 Apr 2026 02:24:12 -0700
Message-ID: <20260416092414.3210383-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6346-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arista.com:dkim,arista.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75BD240C5E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a limitation in the TI BQ32000 RTC where aggressive
I2C polling (done by userspace tools like hwclock on systems where the
interrupt line is not connected to the CPU) can prevent the refresh of
RTC registers.

This results in stale data reads or select() timeouts in userspace.
The series introduces a configurable "settle delay" via device tree
to ensure the hardware has sufficient idle time between read attempts.

Patch 1: Adds the 'ti,read-settle-us' property to the YAML bindings.
Patch 2: Implements the delay in the driver using usleep_range.

Adriana Stancu (2):
  dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
  rtc: bq32000: add configurable delay between RTC reads

 .../devicetree/bindings/rtc/ti,bq32000.yaml   |  5 +++
 drivers/rtc/rtc-bq32k.c                       | 34 +++++++++++++++----
 2 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.51.0


