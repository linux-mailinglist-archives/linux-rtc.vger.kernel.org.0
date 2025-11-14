Return-Path: <linux-rtc+bounces-5385-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEAC5F9C7
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 00:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1789F4E0214
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 23:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7718EFD1;
	Fri, 14 Nov 2025 23:38:26 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9133.ps.combzmail.jp (r9133.ps.combzmail.jp [49.212.13.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D512E7658
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.13.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763163506; cv=none; b=gA9vYc6D5leSS6Dn8YTQWEh4uei+epazGaygR04j2bg14VgPHGPnLBT3/IjGt0Nd47mtDDPvUo+fguoURkiLyBk5B8UgpXFd1sLdTIE9K4Zv+6SnrCPCe+6FS4tVOruNiBqkoHiN5K7LfUsj1RADipfF9h26cmHD9rgVP1GsKSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763163506; c=relaxed/simple;
	bh=UDkCW3cis0xZs3E9VTIU2+LKocYpseGdWkloSA9NuwI=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=SVoBEtWu0OVm17ZDx1Gjzc7nrB/71a5hgG5x/xN56H0OTyr2r5vaBp4hTRhE9mxd7fmdd+9jHwKUCHQflAbzPCaf4Yadpe8RpvRUrCvwnyOBnXcvc7JQpHNToEsqiQFADB3IKgccOs5FyENnzJBWb2RLnIxkYNd3LB1cSMlt7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fc-seminar-online.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=49.212.13.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fc-seminar-online.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9133.ps.combzmail.jp (Postfix, from userid 99)
	id 73D3C85968; Sat, 15 Nov 2025 08:38:07 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9133.ps.combzmail.jp 73D3C85968
To: linux-rtc@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCQFBFZxsoQg==?= =?ISO-2022-JP?B?GyRCPFM0dRsoQg==?= <info@fc-seminar-online.jp>
X-Ip: 374481754221616
X-Ip-source: k85gj74648dnsaq7u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPi87UjI9JE9ESSQkSXchIzwhQCRCZSROGyhC?=
 =?ISO-2022-JP?B?GyRCNjUwaSVTJTglTSU5GyhC?=
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 46q7
X-uId: 6763325337485967675550211004
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20251114233815.73D3C85968@r9133.ps.combzmail.jp>
Date: Sat, 15 Nov 2025 08:38:07 +0900 (JST)

　
　新規事業をお考えの経営者様へ
　いつもお世話になります。
　
　『少子化の時代に、教育事業！？』と、
　思うかもしれませんが
　
　実は、塾代補助金や教育無償化、贈与非課税といった
　国策もあり、子ども1人にかける教育費は増加し、
　市場は堅調に成長しています。
　
　そんな中、　『少子化だから教育はダメ』
　
　という誤った認識の方が多いので、
　学習塾市場にはまだ、『手堅く利益がでるホワイトスペース』が残っています。
　
　いったい、教育市場にどのようなビジネスチャンスがあるのか？　
　をオンラインセミナーでお伝えしますので、ぜひご視聴ください。

　11月18日（火）16：00〜17：00　オンライン開催
----------------------------------------------------------

　　　　　◆フランチャイズ事業　WEB説明会◆

　　　　　“プログラミング教育×個別指導”

　　　　　 不況に強く、少子化でも成長する
　　　　　　　 ハイブリッド型の教育事業

　　　　　　　　　▼  視聴予約 ▼
　　　　　　 https://wam-edu-fc.jp/wam2/

　  　　　　　　　◆　ご案内事業　◆
　　　　　　　　　　 個別指導 WAM

　　　　　　　　　◇　　 提供 　　◇
　　　　　　　  エイチ・エム・グループ

----------------------------------------------------------

　少子化が進む中で、多くの人は 「教育市場は縮小する」 と考えています。
　
　しかし実際は、子ども一人にかける教育費の増加に伴い、
　市場は成長し続けています。

　また、教育費は不況時でも削減されにくいため
　コロナ下でも大きく落ち込むことなく底堅さを見せました。
　幼児教育無償化などの国策もあり、今後も教育投資の増加が予想されます。

　そこでご紹介するのが、「プログラミング×個別指導」の
　ハイブリッド教育事業です。

　プログラミングは小学校で必修化されたため、保護者の関心も高まっています。

　本事業のスタートは「業界未経験」「社員１名」で可能です。
　新たな事業収益づくりをお考えの方は、是非ご参加ください。


　11月18日（火）16：00〜17：00　オンライン開催
　▼  視聴予約はこちら
　https://wam-edu-fc.jp/wam2/

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
　教育事業FCセミナー事務局
　電話：0120-891-893
　住所：東京都中央区銀座7-13-6
―――――――――――――――――――――――――――――――
　本メールのご不要な方には大変ご迷惑をおかけいたしました。
　今後ご案内が不要な方は下記URLよりお手続きをお願いいたします。
　┗　https://wam-edu-fc.jp/mail/

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

