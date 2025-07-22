Return-Path: <linux-rtc+bounces-4537-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A1FB0D83E
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Jul 2025 13:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59DD18936FD
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Jul 2025 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5374B242927;
	Tue, 22 Jul 2025 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQr+DWFJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC022D785;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183850; cv=none; b=aK8aEcprCYXtuF1FdEkJpoWXf95ePNSn4dQiWIceDOjP4LZEJkLOS49KR9z6wDQRvvAESGHIqS9OZ5mjG3FGKhxqTaGglObeerUNoc/w6xBWmW+D+tZrnQ1XVRFHZx2DLoa7icNAFeCNxPjadWavkNWbv794SO/C6p4wTHG8tFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183850; c=relaxed/simple;
	bh=TK9EYYruh2F06Jrfhx9PUGH3rMdXnLUpiSRSNrwKVTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Twp7JfFYMos/SuXPpAJJmh9ftCAQ8TUK7f0mNdZVPCMXuECsc3GjWhdarh5UTZ9TIGfq+eDzwxo6IRYc4eoEULggWUTpruNJERzcOmJcQOiqDqQD+LolwTsq/ewQE3OFz3hAD+I+JndZSEWp9JQ9OVxcFyNgnr16+oBN8GB7O5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQr+DWFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9DBBC4CEEB;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183849;
	bh=TK9EYYruh2F06Jrfhx9PUGH3rMdXnLUpiSRSNrwKVTA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XQr+DWFJL/Xdw2blAlg/cgn9xTKY6/UMIcBc+FzpfH4AHDpkcww26bu0ScnCDNnlx
	 ahSgxHZAVV+yKalhBqcXcYDgDPZsd7zFQJD94aW7x3wsEy7M51tiPqPNcg/xYIoKt+
	 RGcMmSSHfSbgqKEsGXQQZkkAC1xFRLqi+5FRpyBpRSFfZufIQ7FGH7VxTd1ElaKSlI
	 mZsnRExo8qY2993ipVvCs+zix2BSuAXq/DpeoWBrZSi6ZaR0IzsSSgm31cAGcFodow
	 1igMfxJ7SQyopKX3zwfj7JBszE4RqeQwS74BpZAH+yNRu6/5//kO7iiuZVqH6cz874
	 ZPiDiQAGsY61w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99C7C83F1A;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 19:30:48 +0800
Subject: [PATCH v2] rtc: amlogic-a4: Optimize global variables
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAGd2f2gC/23MQQ7CIBCF4as0sxYDVMV25T1MF0CndBIpDTRE0
 3B3sWuX/0vet0PCSJigb3aImClRWGrIUwN21otDRmNtkFxeuRKKxc2yiM7rlYkLR2zvRplJQT2
 sESd6H9hzqD1T2kL8HHYWv/UvkwUTTI+iU+3NWsO7h/av4MiebfAwlFK+9U/PgqYAAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183848; l=1493;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=9dM7dYiSAIYeWx8dG0E9yLzdI2cirE8OM6/rYACd5eg=;
 b=tn0iCa4/fCE+b5om7zwj5nHT9XwVZ+HF0aeqTeNuyh4Iwxx4lPfDBh6ojC8BzTqjKxGyEf9oT
 hd+6OIsagGNCQt1jqbiC+ZBDzTD3FgftuTHRbqZVx5rBRlSu1QFtB3K
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Convert a global variable into a local one of aml_rtc_probe().

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Convert a global variable into a local one of aml_rtc_probe().
---
Changes in v2:
- Modify the submission description.
- Link to v1: https://lore.kernel.org/r/20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com
---
 drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 09d78c2cc691..1928b29c1045 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -72,13 +72,6 @@ struct aml_rtc_data {
 	const struct aml_rtc_config *config;
 };
 
-static const struct regmap_config aml_rtc_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = RTC_REAL_TIME,
-};
-
 static inline u32 gray_to_binary(u32 gray)
 {
 	u32 bcd = gray;
@@ -328,6 +321,13 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret = 0;
 
+	const struct regmap_config aml_rtc_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = RTC_REAL_TIME,
+	};
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;

---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-regmap-140ee38b7bf7

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



