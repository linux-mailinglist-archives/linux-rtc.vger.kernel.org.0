Return-Path: <linux-rtc+bounces-5169-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B1C0BDC8
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 06:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485A93BB5C6
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 05:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74F82D7DD7;
	Mon, 27 Oct 2025 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pUYCoWci"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAD2D739D;
	Mon, 27 Oct 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544119; cv=none; b=cHhMBgLUOGweqt5osGaQ7gBpIu7VxF9PW11UGE4hfL3vGTgkivREl08bFHB6zJcJCH5UkZ+BubEVvTXrIRqpN5K0edcwtPaLK58Bakchyz4xMDoR4ea9V2HJ4mn8EBl3exGY+EHKES7+y5E627TowyIIh+SLu+RvVYMyQpRV5Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544119; c=relaxed/simple;
	bh=qrtsu10R5LaOPyR2BzaYp1CqzUTsNYF/L5ew05NJJUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWiUlAKtC/0ku3JP39NkKAcQN7AqzzQINHleqBtatfy1EMZpvH4s6/oPGkXUCI71/BU91HFe5fhNZmZ5rmcrf3Qj7ptO7TDCFN5NnbxM8pK/Qc/cHPPFSBrNXMfdxBtSTnHln3dcscMtiXkRQKBrnqobXwyJjAgD4ws7K7Al1KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pUYCoWci; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544109;
	bh=8I4+vxckyTpw0x/pY85yqvUPHwDZ9K/bKl+VrKCYDIo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pUYCoWcii0gmSCr4rzMOnExxEfPJkmmraPZpzj+2BHeLJ5I4czMxvX7GYZGis32vn
	 3ZCelMt392wZF0U0NYiwMRXFfBO7p9ge1DjQV1bJeZpcv7RK5GqOnc+F2oQqgoRlH1
	 X75BO1vatXkRwMOkUqwHPekoJ/BgqzV4thi5o/es=
X-QQ-mid: zesmtpsz3t1761544106t35d805fe
X-QQ-Originating-IP: YdVZp3ZiWrpL2fgu8XYgSa+iDrxlJLKacoE9GHE4FKE=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7992623468167245455
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:08 +0800
Subject: [PATCH v2 4/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1089;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=qrtsu10R5LaOPyR2BzaYp1CqzUTsNYF/L5ew05NJJUo=;
 b=fllL427rT0KQnek2I4ijNMRL2nD1KYzgbDwqbJPFw7byVGjmzkjK+CbYAhRjGLBzBqGMg/HgP
 zDN2oRRgWXyCpl7YahtbGGmMAbR/PWEpuDyjWxNAvt5IxWAUtxeBZeC
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NN5tIm2Cw++mg/sU+vivbDCQmqF2smMM0eLHJpeTAN9Xu87NjCaKBV70
	4rkrUs5D5FtXTZaUJgvPNz4FlaPQQOrZ3v2IzBVnuvlFedRwam+hvPt6ZnFtY81GUn+kSHT
	ZSaT2jnRiSBxJ9hajpnxTvL3qd9T0B0l+Sfl1+gWRivqDqVbxrlogONZKzgLEWRalg7Mcs1
	p7w+kN46zuzTlHyAB2UA/fhuJKuiaAH227vTdEGzrPCxvP9lBYRgpLnPSOqUcn7iDoHHOWU
	imavoxirJvg2ESCAHCOdPqS3ZMPP0vgcNFTf9e4mCRSYk0PqvvpplKki56eF2zSlyVfZo3+
	pGwM3q2816M/R7OVwtpNViFyw5+1Y/cJKXwq0F9TDyy6UY3UFSSdFUDIkJGDNVyFBOBbiEC
	VPXHLKJKogmr+TD7TUyKOT2geYXflcgFrmJ9d4qmF33UKnZ9+d0ZAKdyBsWI4VHWdei6LFO
	tkORQq9YGDxrPGDQJ1Sa2huXb3VS5PWtjobyeHHe4F8TMj/UO/cn8XJat2r5TExZC2andTE
	QEJhkUdx8wmaKIdeYni+Fn3Ra0BN4VhE8E/AotQdlUdRT39oNht4w3fb5SlHRZpKOkZPORz
	WuTkhes4TsorE412XR1RLNzBzA+t7QPpB6jTMlnIPuXpijBS71pzs+Bw+kYD+8eRR7b52LF
	4ETd5S/Qvamn0ABvAMECRMt46SsGTTdOMB+Day8pY3jLD77vHGbr4pbkKR2jlNgg9MKiAAa
	+h5Sw1zBrOrCNetvA4CEXpRINdpbFmJ6zkM0yiZ5fN8bXZaBQDVOtVDq4Wzz0fOdleFK6Hw
	dHzHLp3xNY01iKlsxjdBFw+yXmNB9LdGmQERgKoVWvNcaOfhbAoiRwhF/VLVhrGvZ5rdtlY
	+hojM9Acei4GAvIiitr0lilqS4aysTri4WEQjYsO0gChCJLo3vvgPZ5qDwzCDkESnx/+01f
	mfht22zvCQ719zzqpWXJ9aIBi1N4uGg51DAAiEZxSXqCyxVS3EPq4BbddHk/EcNpa58HVbU
	88VVr1RLb0e7/cISnCzNz30r5Hcq3aWE/hH6ROysnhykvP5G+abY/k/u39AvREBEWZQrCap
	lWsnRQpZqN3XccrgovkaMeX73UAqfb1mOHmxIalYVSO3WbybOXBxr99ZtgzVM3Ncg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/regulator/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d84f3d054c59d86d91d859808aa73a3b609d16d0..f5ee804077cfcb300ca5cf5d865b6684943cd749 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1455,8 +1455,7 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
+	depends on MFD_SPACEMIT_P1
 	default ARCH_SPACEMIT
 	help
 	  Enable support for regulators implemented by the SpacemiT P1

-- 
2.51.1


