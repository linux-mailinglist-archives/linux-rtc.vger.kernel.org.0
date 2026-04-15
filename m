Return-Path: <linux-rtc+bounces-6342-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fy8EIW432mOYQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6342-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 18:10:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EAF406486
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 18:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD26C300F533
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECEB31AAA8;
	Wed, 15 Apr 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhLb7LuM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EEA381AE0
	for <linux-rtc@vger.kernel.org>; Wed, 15 Apr 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269323; cv=none; b=KUsO/J7dcbJDSmLVcxxzMJbWPmU3YMV8Cl9VsBnb4l0lhZnxLNL4SOWSY1d/rZlEAL0xc9cCb+5IrWa6n01TZuOJXrt3DyhoP/NzSKAKvwqdOs/zXs3snLW5UUrDDicrneb3FDYr1ZZjUtmQD+VUcVpQpjTvUZo4rneMUcTAK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269323; c=relaxed/simple;
	bh=jMqQvHDH2lwJH+8MK75B6OZ9tIA2KP8DnA2nTclqSbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpbiM8/s5Nzchn8MCLY1cFwlXd/CKjJrVBB2Upi7BCIj/5ZV3utljNclnDMqQei9o7sw5cS8Tjxog2uGrgNH22R8zVgrZUWK53nQFtuVjJuspuqt3uCMyFobmu2Ml+Xr9XkJUidaxrPC7xtZh1VnRsaPTHq27H8rMXpEos5v7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhLb7LuM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso114639645e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 15 Apr 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269320; x=1776874120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nGy8cs9TuK82zOcS8+ppBLbL8+nzVMmWL3xkF4nuKs=;
        b=HhLb7LuMp/wRTe33M6tsZTVkRNbXO8IePy0FHMJBJ2me+iwByr+nkMY84gsV+hXhkX
         qTDp8Go6j73eyd0xm2VlMlQhXxdZTJDLsFfNE6zwm4uTow0KsycLFfTOiNnJhcpUA+iQ
         BqgWI5l5iGNUJHt0TTxQjEhCmEMY+Czhgk36oFkW9FhHsfN04FhuW4xUdG07+2lIWHr4
         TBmgDExv0w2w8bH78N5hCl6jIW8XSp7DlhNI+CZ/2u4tnm01m3QoMoz44mDdCUr46dgL
         PtZHnKb8NEWcINGCNZncUJB5xU35rS+fV5TJtA6BJu3Xkctp/RigpAmv7a1PToDx3k9C
         KmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269320; x=1776874120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nGy8cs9TuK82zOcS8+ppBLbL8+nzVMmWL3xkF4nuKs=;
        b=d8NvZAKPqvhBl/lLjFkHoAlcScb399wfSKeszU0i25j8xjS2RBSGKsRLkPcxEEgSgu
         o2pzPB6Wv83mj+GCmJgPYNAFH8n3Yb+gXrXqBq8+ZXWcs3jbs6pFWjeCQWUvSz10lxcg
         +qKa8jFa0yXXHbZvOYJUOduuHQwKcJzE003jwEHy5tMyNATz9J310WMI8L8ox5vud2mi
         edruQu1uLpSLcHxTaHCB0sS2g8ST8cGCPyEnq3YTq1BlDifbR0VExJ8hSD+Glm9G5hEA
         llYSfQhfTPfUlN04b0w7k+PtI/Ra9Z1ypHDOmPu8/2wa8DMg5hhB/Ln+9QcTeDHG8aff
         103g==
X-Forwarded-Encrypted: i=1; AFNElJ+uoqWCPkvWWz2fOHIOQaFPuf/sXntbruaLoH40jGvuncyRD+gOb9eKUcM695/oYGuK10R0onUDrss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBpTbSqewN3hJMkMvWuj5ZxPGnmE34tENBe+TU1jVwgKcBgHa
	vdBBFT/LV8k45PXp3z+9y7nWpl5Rvd5ICagT9ayHXkFsHjAyMETpk/UfZHQC+Zh/
X-Gm-Gg: AeBDietYgqLqHlZ61THfF4CkTr9turq96S0jhC7nJhT679SwQ4LDbS61FgSQxIf5jyG
	2GfdaPchMy+3Yg1CEz0FxOyq0rKK7ui2DGQ8BKAieBe12scVXr6CuCuuoiSMqB4F+3fr2C+1bsI
	u67FPFzWN6D1iQDMFqV0RXpjNOVvSJvKMsN7E/7rJ6Khv9vXi1xFUOGtxFwtEmdpUwJnLXGVLbs
	LKOw8Q8Vy8jI02DM/stJgpIhu0Mw2aXpJvqA7t74/G6ICysV22WtI7KXlhxyShDPTdy54jNA/XJ
	NKq9CPnWjruNWBgbi42xd0juapjnuSWYa/MVP7S9a3sFK6m71A0O1gn0RfS+hASwLg3ZlAp1cGY
	z/zPX1ckFV9Wi9de+7Z+SgihWdCe6M/0AsGu+6d818Esm7BnMdxBBxmxysGQuZ1QAOVBYpeBJ6/
	d7sgDpQSrWHQKsFrCKXBbi3unJeg==
X-Received: by 2002:a05:600c:1f83:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488d6864dd2mr310638985e9.22.1776269320058;
        Wed, 15 Apr 2026 09:08:40 -0700 (PDT)
Received: from antoniarch ([37.163.125.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0ec6cc6sm23482975e9.29.2026.04.15.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:08:39 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: marex@denx.de,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH] rtc: abx80x: fix the RTC_VL_CLR clearing all status flags
Date: Wed, 15 Apr 2026 18:06:11 +0200
Message-ID: <20260415160610.127155-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[denx.de,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-6342-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apokusinski01@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72EAF406486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTC_VL_CLR ioctl intends to clear only the battery low flag (BLF),
however the current implementation writes 0 to the status register,
clearing all status bits.

Fix this by writing back the masked status value so that only BLF is
cleared, preserving other status flags.

Fixes: ffe1c5a2d427 ("rtc: abx80x: Implement RTC_VL_READ,CLR ioctls")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 3fee27914ba8..5c2424a00b7e 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -545,7 +545,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 
 		status &= ~ABX8XX_STATUS_BLF;
 
-		tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
+		tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+						status);
 		if (tmp < 0)
 			return tmp;
 
-- 
2.53.0


