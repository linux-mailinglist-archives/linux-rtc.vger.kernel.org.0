Return-Path: <linux-rtc+bounces-5324-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7DC5211D
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 12:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7361897022
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE82B3148D8;
	Wed, 12 Nov 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="kp+76Fc2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093C313E24;
	Wed, 12 Nov 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762947909; cv=pass; b=Zhtxy9CbrlVlbJUHqYDJxXXbzych3civvhhX40PfJXm98bTcc8IJYivSyf8M+VZe5s1RAamaQlKqIegkTttJOyTi5uLzqwH4uxi/Rt45ISzN1eozs8dUSQ38nhDKZoroANH47bhoZTLyLk/4scPRDUjfZGNM8j3saxEENvBZeKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762947909; c=relaxed/simple;
	bh=HDXaiRc1VzTANVt9xw5CI/8qsYIEfLU8f6fpFkFRgiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXQGDGizg0z4EFjetQJSctBv+/3DKxIYu2y0pS5S983QlP+/g2mzs/LanB1XAd8+4MT7juWtGmBE6hPXBgKZ1QN/DKb3HWtXimcvGpSmR1HhwLW55rrONBFupTel0HvMpdI4h7eItvJCUcc+IvpgIOiAeCVqq/oUzsoZ8NS5kB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=kp+76Fc2; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id E13791116C841;
	Wed, 12 Nov 2025 20:38:07 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3-AdmoTuXKJ; Wed, 12 Nov 2025 20:38:04 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id B8BDA10B4100B; Wed, 12 Nov 2025 20:38:04 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1762947484;
	cv=none; b=Exn2CsSCFGKngR5HMvmdGXABoscxs/9JSHjMwrF1FHhv0vcKkZ/Dze93dU2aAIj7Eo3OhXAmLHj/m7Cv7M0Y3pvb/cDz8iZXXt8gBFnQqI+8er3UfFWF1fSR4iZvWxsPA/cfPZ3GF6hjx5dZDQn5CQ/pjKlPOpe2eyy9K4sC38o=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1762947484; c=relaxed/relaxed;
	bh=Q1hT18l1dO/zqdkjffLbjjbAPImRtW7wCjrLxZl9Y7Q=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=MUH8ZQ9fZ6KZi+MH/BQPGnxO2oA8asJhmuCabiR084QO+6O/OjTcZnUrjZTGfVi2nlIe7Q6i7d46fZfaW0tl5OwX5qagVIs9e2ciUXrFAj0vm1TJfHVe7pjRdjRZbR2Uz5woc3xPfMb1/xR+apoEIKHZaaVFAD755BYkuMDcCf0=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org B8BDA10B4100B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1762947484;
	bh=Q1hT18l1dO/zqdkjffLbjjbAPImRtW7wCjrLxZl9Y7Q=;
	h=From:To:Cc:Subject:Date:From;
	b=kp+76Fc2kq+wK+7ziBc0C6/Zga+NcYOmPbf6w6ET/82srgTt92gR66USCOQ2BFr1W
	 Dqh37RBb0wVgnxikbLTPkE8gFt1nGP6jGgIMR4VIKLOLdfusL2NScYn8IBVy9EMX66
	 Lmxkcz/Vxv88hzKqAzGcIoOFmHCpy+ebykbTRgLM=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] Documentation: ABI: testing: Fix "upto" typo in rtc-cdev
Date: Wed, 12 Nov 2025 20:37:59 +0900
Message-ID: <20251112113759.2953758-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The word "upto" is a common typo for "up to". Correct this.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/ABI/testing/rtc-cdev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/rtc-cdev b/Documentation/ABI/testing=
/rtc-cdev
index 25910c3c3d7e..cec099a27c6d 100644
--- a/Documentation/ABI/testing/rtc-cdev
+++ b/Documentation/ABI/testing/rtc-cdev
@@ -14,7 +14,7 @@ Description:
 		  for RTCs that support alarms
=20
 		* RTC_ALM_READ, RTC_ALM_SET: Read or set the alarm time for
-		  RTCs that support alarms. Can be set upto 24 hours in the
+		  RTCs that support alarms. Can be set up to 24 hours in the
 		  future. Requires a separate RTC_AIE_ON call to enable the
 		  alarm interrupt. (Prefer to use RTC_WKALM_*)
=20
--=20
2.47.3


